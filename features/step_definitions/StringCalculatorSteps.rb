
Given /^I grab my calculator$/ do
	@calculator = StringCalculator.new
end

Given /^I only tell one number$/ do
  pending # express the regexp above with the code you wish you had
end

When /^I ask for the sum of "([^"]*)"$$/ do |numbers|
	@result = @calculator.add(numbers)
end

Then /^the result of its sum is (\d+)$/ do |sum|
	@result.should == sum.to_i
end
