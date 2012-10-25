#!/usr/bin/env ruby

require_relative '../lib/noisrev'
require_relative '../lib/noisrev/import'

p Version.new

version = Version 0, 0, 1

p version
p Version.parse '0.0.1'

p version.to_s

p(version > '0.0.0')
p(version > '0.0.1')
p(version == '0.0.1')
p('0.0.1' == version)
p version.next.to_s
p version.next(:major).to_s

p('0.10.0' > '0.2.0')
p(Version.new(0, 10, 0) > '0.2.0')
p('0.2.0' > Version.new(0, 10, 0))
p('0.2.0' > Version.new(0, 1, 0))
p RUBY_VERSION
p Version::RUBY_VERSION
p version.runnable?
version.depend(:Ruby, '3.0.1')
p version.runnable?
version.depend(:Ruby, '1.9.2'..'3.0.2')
p version.runnable?
