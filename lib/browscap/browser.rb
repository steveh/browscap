module Browscap
  class Browser

    BOOLEAN_ATTRIBUTES = [:activex_controls, :alpha, :aol, :background_sounds,
      :beta, :cookies, :crawler, :frames, :iframes, :banned, :mobile_device,
      :syndication_reader, :java_applets, :javascript, :supports_css, :tables,
      :vbscript, :win16, :win32, :win64]

    OTHER_ATTRIBUTES = [:aol_version, :browser, :css_version, :major_ver,
      :minor_ver, :platform, :version]

    attr_accessor *(BOOLEAN_ATTRIBUTES + OTHER_ATTRIBUTES)

    BOOLEAN_ATTRIBUTES.each do |attribute|
      alias :"#{attribute}?" :"#{attribute}"
    end

  end
end
