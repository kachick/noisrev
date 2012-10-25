noisrev
========

Description
-----------

Version <-> Noisrev

Features
--------

* Expression for library versions
* Keeping compatibility with String
* Pure Ruby :)

Usage
-----

### Setup

```ruby
require 'noisrev'
require 'noisrev/core_ext' #=> Version = Noisrev
```

### Keeping comparisons with String

```ruby
'0.10.0' > '0.2.0')          #=> false
Version(0, 10, 0) > '0.2.0') #=> true
'0.2.0' > Version(0, 10, 0)) #=> false
'0.2.0' > Version(0, 1, 0))  #=> true
```

### Dependency checker

```ruby
RUBY_VERSION                           #=> '1.9.3'
version = Version.parse '0.0.1'
version.runnable?                      #=> true
version.depend :Ruby, '3.0.1'
version.runnable?                      #=> false
version.depend :Ruby, '1.9.2'..'3.0.2'
version.runnable?                      #=> true
```

Requirements
-------------

* Ruby - [1.9.2 or later](http://travis-ci.org/#!/kachick/noisrev)
* [striuct](https://github.com/kachick/striuct) - 0.4

Build Status
-------------

[![Build Status](https://secure.travis-ci.org/kachick/noisrev.png)](http://travis-ci.org/kachick/noisrev)

Install
-------

```bash
$ gem install noisrev
```

Link
----

* [code](https://github.com/kachick/noisrev)
* [API](http://kachick.github.com/noisrev/yard/frames.html)
* [issues](https://github.com/kachick/noisrev/issues)
* [CI](http://travis-ci.org/#!/kachick/noisrev)
* [gem](https://rubygems.org/gems/noisrev)

License
--------

The MIT X11 License  
Copyright (c) 2012 Kenichi Kamiya  
See MIT-LICENSE for further details.
