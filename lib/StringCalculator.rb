require 'NumberCollection'
require 'String'

class StringCalculator

  def add(numbers)

    numbers_splitted = NumberCollection.new(numbers.split!)
    return numbers_splitted.add
  end
end