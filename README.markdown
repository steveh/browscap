# browscap

A simple library to parse the beloved [browscap.ini](http://browsers.garykeith.com/downloads.asp) file.
This gem was ported to Ruby by [Lukas Fittl](http://github.com/lfittl) from Python.
The original [code](http://code.google.com/p/python-browscap/source/browse/trunk/browscap.py) was written by Henning Schroeder.
Additional patches by Gilles Devaux.
Refactored by Steve Hoeksema.

## Usage

    require 'browscap'
    bcap = Browscap.new
    browser = bcap.query("Mozilla/5.0 (compatible; Konqueror/3.5; Linux; X11; de) KHTML/3.5.2 (like Gecko) Kubuntu 6.06 Dapper")

    browser.crawler?    # => false
    browser.version     # => 3.5

## Copyright

This code is distributed under the GNU General Public License version 2. See LICENSE for details.
