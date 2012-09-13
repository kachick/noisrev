require_relative 'helper'

class TestNoisrev < Test::Unit::TestCase

  VERSION = Noisrev.new 0, 0, 1

  def test_parse
    assert_equal(VERSION, Noisrev.parse('0.0.1'))
    assert_equal([1, 2, 3, 'a'], Noisrev.parse('1.2.3.a').values)
  end
  
  def test_to_s
    assert_equal('0.0.1', VERSION.to_s)
  end
  
  def test_compare
    assert_equal(false, (VERSION < '0.0.0'))
    assert_equal(true, (VERSION > '0.0.0'))
    assert_equal(true, (VERSION == '0.0.1'))
    assert_equal(true, (VERSION.next == '0.0.2'))
    assert_equal(true, (VERSION.next(:major) == '1.0.0'))
    assert_equal(true, (VERSION.next(:minor) == '0.1.0'))
    assert_equal(true, (Noisrev.new(0, 10, 0) > '0.2.0'))
    assert_equal(false, ('0.2.0' > Noisrev.new(0, 10, 0)))
  end
  
  def test_ruby_version
    assert_equal(::RUBY_VERSION, Noisrev::RUBY_VERSION)
  end
  
  def test_depend
    version = VERSION.dup
    assert_equal(true, version.runnable?)
    version.depend(:Ruby, Noisrev::RUBY_VERSION.next)
    assert_equal(false, version.runnable?)
    version.depend(:Ruby, '1.9.2'..Noisrev::RUBY_VERSION.next)
    assert_equal(true, version.runnable?)
  end

end
