# browscap

A simple library to parse the beloved [browscap.ini](http://browsers.garykeith.com/downloads.asp) file.  This gem was ported to Ruby by [Lukas Fittl](http://github.com/lfittl) from Python.  The original [code](http://code.google.com/p/python-browscap/source/browse/trunk/browscap.py) was written by Henning Schroeder.

## Usage

    require 'browscap'
    bcap = Browscap.new
    browser = bcap.query("Mozilla/5.0 (compatible; Konqueror/3.5; Linux; X11; de) KHTML/3.5.2 (like Gecko) Kubuntu 6.06 Dapper")

    browser.crawler?    # => false
    browser.version     # => 3.5

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a future version unintentionally.
* Commit, do not mess with rakefile, version, or history.  If you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull.
* Send me a pull request. Bonus points for topic branches.

## Copyright

This code is distributed under the GNU General Public License version 2. See LICENSE for details.
