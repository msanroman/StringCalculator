
class StringCalculator

	def add(numbers)

		if numbers.include? ','
			numbers_splitted = getNumbersSplitted(numbers)
			sum = numbers_splitted.reduce(:+)
		end
		sum = 0 if numbers == ""
		sum = numbers.to_i if sum.nil?
		return sum
	end

	private
	def getNumbersSplitted(numbers)

		numbers.split(',').collect{|number| number.to_i}
	end
end