
class StringCalculator

	def add(numbers)

		if numbers.include? ',' or numbers.include? '\n'
			numbers_splitted = getNumbersSplitted(numbers)
			sum = numbers_splitted.reduce(:+)
		end
		sum = 0 if numbers == ""
		sum = numbers.to_i if sum.nil?
		return sum
	end

	private
	def getNumbersSplitted(numbers)

		numbers.split(',').collect { |elements|
			elements.split('\n')
		}.reduce(:+).collect { |number|
			number.to_i
		}
	end
end