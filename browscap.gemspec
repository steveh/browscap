# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{browscap}
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Henning Schroeder", "Lukas Fittl", "Jason Adams"]
  s.date = %q{2010-07-01}
  s.description = %q{A simple library to parse the beloved browscap.ini file (ported to ruby from Henning Schroeder's python code by Lukas Fittl).}
  s.email = ["lukas@fittl.com", "jasonmadams@gmail.com"]
  s.extra_rdoc_files = [
    "LICENSE",
     "README.markdown"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.markdown",
     "Rakefile",
     "VERSION",
     "browscap.gemspec",
     "ini/default.ini",
     "lib/browscap.rb",
     "spec/browscap_spec.rb"
  ]
  s.homepage = %q{http://github.com/lfittl/browscap}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{A simple library to parse the beloved browscap.ini file}
  s.test_files = [
    "spec/browscap_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<inifile>, [">= 0.3.0"])
    else
      s.add_dependency(%q<inifile>, [">= 0.3.0"])
    end
  else
    s.add_dependency(%q<inifile>, [">= 0.3.0"])
  end
end

