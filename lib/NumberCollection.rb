require 'Integer'

class NumberCollection < Array

  def initialize(numbers)
    
    numbers.each{ |number|
      self << number
      raise "negatives not allowed: #{number}" if number.isNegative?
    }
  end

  def add

    return 0 if smallEnough.empty?
    smallEnough.reduce(:+)
  end

  def smallEnough

    self.select{|number| not number.isTooBig?}
  end
end