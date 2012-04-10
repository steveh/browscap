# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "browscap/version"

Gem::Specification.new do |s|
  s.name        = "iqc-browscap"
  s.version     = Browscap::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Henning Schroeder", "Lukas Fittl", "Jason Adams", "Gilles Devaux", "Steve Hoeksema", "Colm McBarron"]
  s.email       = ["colm.mcbarron@iqcontent.com"]
  s.homepage    = "https://github.com/colmmcbarron/browscap"
  s.summary     = "A simple library to parse the beloved browscap.ini file"
  s.description = "A simple library to parse the beloved browscap.ini file (ported to ruby from Henning Schroeder's python code by Lukas Fittl)."

  #s.rubyforge_project = "steveh-browscap"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "inifile", "~> 0.4"

  s.add_development_dependency "rspec", "~> 2.6"
end
