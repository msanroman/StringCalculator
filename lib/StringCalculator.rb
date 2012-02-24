
class StringCalculator


	def add(numbers)

		if numbers.areDelimited?
			numbers_splitted = numbers.split!
			sum = numbers_splitted.reduce(:+)
		end
		sum = 0 if numbers.empty?
		sum = numbers.to_i if sum.nil?
		return sum
	end

end

class String

	CUSTOM_DELIMITER_PREFIX = '//'
	CUSTOM_DELIMITER_SUFFIX = '\n'

	def areDelimited?

		delimiters = Delimiters.new(self)
		delimiters.each{ | delimiter |

			return true if self.include? delimiter 
		}
		return false
	end

	def split!

		regular_expression = Regexp.new(Delimiters.new(self).to_s)
		self.split(regular_expression).collect { |number|
			number.to_i
		}
	end

	def hasCustomDelimiter?

		self.index(CUSTOM_DELIMITER_PREFIX) == 0
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
