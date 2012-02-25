
Given /^I grab my calculator$/ do
	@calculator = StringCalculator.new
end

When /^I ask for the sum of "([^"]*)"$$/ do |numbers|
	begin
		@result = @calculator.add(numbers) 
	rescue => exception 
		@exception = exception
	end
end

Then /^the result of its sum should be (\d+)$/ do |sum|
	@result.should == sum.to_i
end

Then /^an exception saying "([^"]*)" should be risen$/ do |message|
@exception.message.should == message
end