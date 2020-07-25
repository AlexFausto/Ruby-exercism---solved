module ArmstrongNumbers

  def self.formula(number)
    # our result 
    alpha = 0
    # here n is the number of digits
    n = number.to_s.length
    # the actual formula 
    while number != 0 do
      alpha += (number%10)**n
      number /= 10 
    end
    # we return the formula result
    alpha
  end

  def self.include?(n)
    # is n an Armstrong number ?
    n == ArmstrongNumbers.formula(n)
  end

end