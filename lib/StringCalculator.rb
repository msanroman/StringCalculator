
class StringCalculator

  def add(numbers)

    numbers_splitted = NumberCollection.new(numbers.split!)
    return numbers_splitted.add
  end
end

class NumberCollection < Array

  def initialize(numbers)
    
    numbers.each{ |number|
      self << number
      raise "negatives not allowed: #{number}" if number.isNegative?
    }
  end

  def add

    if smallEnough.empty?
      sum = 0
    else sum = smallEnough.reduce(:+)
    end
    return sum
  end

  def smallEnough

    self.select{|number| not number.isTooBig?}
  end
end

class Integer

  NUMBER_TOO_BIG = 1001

  def isTooBig?

    self >= NUMBER_TOO_BIG
  end

  def isNegative?

    self < 0
  end
end

class String

  CUSTOM_DELIMITER_PREFIX = '//'
  CUSTOM_DELIMITER_SUFFIX = '\n'

  def split!

    regular_expression = Regexp.new(Delimiters.new(self).to_s)
    self.split(regular_expression).collect { |number|
      number.to_i
    }
  end

  def hasCustomDelimiter?

    self.start_with?(CUSTOM_DELIMITER_PREFIX)
  end

  def delimiter

    self[custom_delimiter_start..custom_delimiter_end]
  end

  def custom_delimiter_start

    CUSTOM_DELIMITER_PREFIX.length
  end

  def custom_delimiter_end

    CUSTOM_DELIMITER_SUFFIX.length
  end
end

class Delimiters < Array

  VALID_DELIMITERS = [',','\n']

  def initialize(string)

    VALID_DELIMITERS << string.delimiter if string.hasCustomDelimiter?
    VALID_DELIMITERS.each { |delimiter|
     self << delimiter
   }
 end
end
