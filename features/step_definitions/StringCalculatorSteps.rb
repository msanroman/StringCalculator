
Given /^I don't want to ask any number$/ do
	@calculator = StringCalculator.new
end

When /^I ask for the sum of nothing$/ do
	@result = @calculator.add("")
end

Then /^the result of its sum is (\d+)$/ do |sum|
	@result.should == sum.to_i
end
