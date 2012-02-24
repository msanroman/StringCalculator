Feature: String Calculator
	In order to avoid maximum embarrassment
	As a math idiot
	I want to be told the sum of some numbers.

	Scenario: I don't tell any number
		Given I don't want to ask any number
		When I ask for the sum of nothing
		Then the result of its sum is 0

