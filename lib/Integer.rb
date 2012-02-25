class Integer

  NUMBER_TOO_BIG = 1001

  def isTooBig?

    self >= NUMBER_TOO_BIG
  end

  def isNegative?

    self < 0
  end
end