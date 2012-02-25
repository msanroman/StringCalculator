require 'Delimiters'

class String

  CUSTOM_DELIMITER_PREFIX = '//'
  CUSTOM_DELIMITER_SUFFIX = '\n'

  def split!

    delimiters = Delimiters.new(customDelimiter)
    regular_expression = Regexp.new(delimiters.to_s)
    self.split(regular_expression).collect { |number|
      number.to_i
    }
  end

  def hasCustomDelimiter?

    self.start_with?(CUSTOM_DELIMITER_PREFIX)
  end

  def customDelimiter

    return '' unless hasCustomDelimiter?
    self[custom_delimiter_start..custom_delimiter_end]
  end

  def custom_delimiter_start

    CUSTOM_DELIMITER_PREFIX.length
  end

  def custom_delimiter_end

    CUSTOM_DELIMITER_SUFFIX.length
  end
end