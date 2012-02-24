Feature: String Calculator
	In order to avoid maximum embarrassment
	As a math idiot
	I want to be told the sum of some numbers.

	Scenario: I don't tell any number
		Given I grab my calculator
		When I ask for the sum of ""
		Then the result of its sum should be 0

	Scenario Outline: I only tell one number
		Given I grab my calculator
		When I ask for the sum of <number>
		Then the result of its sum should be <sum>
		Examples:
		| number | sum |
		| "1"	 | 1 |
		| "5"	 | 5 |
		| "50"	 | 50 |

	Scenario Outline: I tell two numbers
		Given I grab my calculator
		When I ask for the sum of <numbers>
		Then the result of its sum should be <sum>
		Examples:
		| numbers | sum |
		| "1,2"	|	3	|
		| "5,7"	|	12	|
		| "10,5"|	15	|

