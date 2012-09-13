class Noisrev

  class << self

    # @param [String, #split] str ex: '0.0.1.a'
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

      for_values(*values)
    rescue
      raise 'Unknown format'
    end

    # @return [Noisrev]
    def first
      for_values 0, 0, 1
    end

  end

end
