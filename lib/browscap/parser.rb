require "inifile"

module Browscap
  class Parser

    def initialize(filename = File.join(File.dirname(__FILE__), '../..', 'ini', 'default.ini'), opts={})
      @@user_agent_properties ||= {}
      @@user_agent_regexps ||= {}
      @@match_cache ||= {}
      @@encoding = opts[:encoding] || 'ISO-8859-1'

      if @@user_agent_properties.empty? || @@user_agent_regexps.empty?
        ini = IniFile.load(filename, :encoding => @@encoding)

        # Remote meta sections
        ini.delete_section '*'
        ini.delete_section 'GJK_Browscap_Version'

        # Create a list of non-parent sections
        child_sections = ini.sections.dup
        ini.sections.each do |section|
          child_sections.delete ini[section]["Parent"]
        end

        # Populate user_agent_properties and user_agent_regexps
        child_sections.each do |section|
          properties = get_browser_props(ini, section)

          browser = Browser.new
          browser.browser = properties['Browser']
          browser.version = properties['Version']
          browser.major_ver = properties['MajorVer'].to_i
          browser.minor_ver = properties['MinorVer'].to_i
          browser.platform = properties['Platform']
          browser.alpha = properties['Alpha'].to_s.downcase == 'true'
          browser.beta = properties['Beta'].to_s.downcase == 'true'
          browser.win16 = properties['Win16'].to_s.downcase == 'true'
          browser.win32 = properties['Win32'].to_s.downcase == 'true'
          browser.win64 = properties['Win64'].to_s.downcase == 'true'
          browser.frames = properties['Frames'].to_s.downcase == 'true'
          browser.iframes = properties['IFrames'].to_s.downcase == 'true'
          browser.tables = properties['Tables'].to_s.downcase == 'true'
          browser.cookies = properties['Cookies'].to_s.downcase == 'true'
          browser.background_sounds = properties['BackgroundSounds'].to_s.downcase == 'true'
          browser.javascript = properties['JavaScript'].to_s.downcase == 'true'
          browser.vbscript = properties['VBScript'].to_s.downcase == 'true'
          browser.java_applets = properties['JavaApplets'].to_s.downcase == 'true'
          browser.activex_controls = properties['ActiveXControls'].to_s.downcase == 'true'
          browser.banned = properties['isBanned'].to_s.downcase == 'true'
          browser.mobile_device = properties['isMobileDevice'].to_s.downcase == 'true'
          browser.syndication_reader = properties['isSyndicationReader'].to_s.downcase == 'true'
          browser.crawler = properties['Crawler'].to_s.downcase == 'true'
          browser.css_version = properties['CssVersion'].to_i
          browser.supports_css = browser.css_version > 0
          browser.aol_version = properties['aolVersion'].to_i
          browser.aol = browser.aol_version > 0
          
          @@user_agent_properties[section] = browser

          # Convert .ini file regexp syntax into ruby regexp syntax
          regexp = section.dup
          regexp.gsub! /([\^\$\(\)\[\]\.\-])/, "\\\\\\1"
          regexp.gsub! "?", "."
          regexp.gsub! "*", ".*?"

          @@user_agent_regexps[section] = Regexp.new(("^%s$" % regexp).force_encoding(@@encoding))
        end
      end
    end

    # Looks up the given user agent string and returns a dictionary containing information on this browser or bot.
    def query(user_agent)
      section = match(user_agent)
      @@user_agent_properties[section]
    end

    alias =~ query

    protected

      def match(user_agent)
        return @@match_cache[user_agent] if @@match_cache[user_agent]

        matching_section = ''

        @@user_agent_regexps.each do |section, regexp|
          # Find the longest regexp that matches the given user_agent_string. The length check is needed since multiple reg-exps may match the user_agent_string.
          if regexp.match(user_agent) && section.length > matching_section.length
            matching_section = section
          end
        end

        @@match_cache[user_agent] = matching_section
        matching_section
      end

      # Recursively traverses the properties tree (based on 'parent' attribute of each section) and
      # returns a dictionary of all browser properties for the given section name. The properties lower
      # in the tree override those higher in the tree.
      def get_browser_props(ini, section)
        data = {}

        if parent = ini[section]["Parent"]
          data.merge! get_browser_props(ini, parent)
        end

        data.merge! ini[section]
        data
      end

  end
end