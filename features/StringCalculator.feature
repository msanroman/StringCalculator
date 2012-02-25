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

	Scenario: I tell the numbers dividing by commas or by new lines
		Given I grab my calculator
		When I ask for the sum of "1\n2\n3"
		Then the result of its sum should be 6

	Scenario: It should be able to support new delimiters
		Given I grab my calculator
		When I ask for the sum of "//;\n1;2"
		Then the result of its sum should be 3

	Scenario Outline: It should throw an exception if passed negatives
		Given I grab my calculator
		When I ask for the sum of <numbers>
		Then an exception saying <message> should be risen
		Examples:
		| 	numbers 		| 		message 			   |
		|	"-1,2"			| "negatives not allowed: -1"  |
		|	"-10,24"		| "negatives not allowed: -10" |
		|	"54,-22"		| "negatives not allowed: -22" |
		|	"54,-22,-1,-100"| "negatives not allowed: -22" |

	Scenario: Numbers bigger than 1000 should be ignored
		Given I grab my calculator
		When I ask for the sum of "2,1001"
		Then the result of its sum should be 2