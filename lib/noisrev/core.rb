require 'striuct'

#@author Kenichi Kamiya
class Noisrev < Striuct.new
  include Comparable

  VERSION = '0.0.2.a'.freeze
  Version = VERSION
  DELIMITER = '.'.freeze
  
  class << self
    # @param [#split] str ex: '0.0.1.a'
    # @return [Noisrev]
    def parse(str)
      tokens = str.split(DELIMITER)
      values = tokens.first(3).map{|s|Integer s}

      case tokens.length
      when 3
      when 4
        values << tokens.last
      else
        raise
      end

      load_values(*values)
    rescue
      raise 'Unknown format'
    end
    
    # @return [String]
    def inspect
      "#{self.class} (express versions)"
    end
    
    def first
      load_values 0, 0, 1
    end
  end

  versionable_number = ->v{v.instance_of?(Fixnum) && v >= 0}
  %w[major minor revision].each do |name|
    member name, versionable_number
    default name, 0
  end

  alias_method :patch, :revision
  alias_method :patch=, :revision=

  member :optional, nil, versionable_number,
         ->v{[Symbol, String].any?{|klass|v.kind_of? klass} && (! v.empty?)}
  close

  def initialize(*values)
    super(*values)
    @dependencies = {}
  end

  # @return [Array]
  def valids
    optional ? values : values[0..-2]
  end

  # @param [Noisrev, String, Fixnum, #to_str] other
  # @return [Fixnum]
  def <=>(other)
    case other
    when self.class
      valids <=> other.valids
    when String
      self <=> self.class.parse(other)
    when Fixnum
      major <=> other
    else
      if other.respond_to?(:to_str)
        self <=> other.to_str
      else
        raise TypeError
      end
    end
  end

  # @return [String]
  def to_s
    valids.join DELIMITER
  end
  
  alias_method :to_str, :to_s
  
  # @return [self]
  def current
    self
  end
  
  # @param [Symbol, String] field
  # @return [Noisrev]
  def succ(field=:revision)
    raise NameError unless member? field
  
    self.class.load_pairs({}.tap{|hash|
      each_pair do |name, value|
        hash[name] = name == field ? (value.succ) : value
        break if name == field
      end
    })
  end
  
  alias_method :next, :succ

  # @param [Symbol, String] name
  def depend(name, range)
    name = (
      case name
      when /\Aruby\z/i
        :Ruby
      when /\A[A-Z]/
        name.to_sym
      else
        raise NameError
      end
    )
    
    @dependencies[name] = range
  end

  def runnable?
    @dependencies.all? {|name, range|
      current_version = (
        case name
        when :Ruby
          self.class::RUBY_VERSION
        else
          if (eval "defined? #{name}::VERSION") == 'constant'
            self.class.parse(eval "#{name}::VERSION")
          else
            raise "undefined constant or version for #{name}"
          end
        end
      )
    
      case range
      when Range
        range.include? current_version
      else
        current_version >= range
      end
    }
  end

  def freeze
    @dependencies.freeze
    super
  end
end

class Noisrev
  RUBY_VERSION = parse(::RUBY_VERSION).freeze
end
