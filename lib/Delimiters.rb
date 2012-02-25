
class Delimiters < Array

  VALID_DELIMITERS = [',','\n']

  def initialize(customDelimiter = '')

    VALID_DELIMITERS << customDelimiter if not customDelimiter.empty?
    # VALID_DELIMITERS << string.delimiter if string.hasCustomDelimiter?
    VALID_DELIMITERS.each { |delimiter|
     self << delimiter
    }
 end
end