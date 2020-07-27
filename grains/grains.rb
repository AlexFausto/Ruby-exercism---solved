module Grains
  def self.square(n)
    # first we check for a valid square number
    raise ArgumentError unless n > 0 && n < 65
    # following the formula
    # square n has 2 to the power n-1 grains  
    2**(n-1)
  end
  def self.total
    # 2**0 + 2**1 + .. + 2**n = 2**(n+1) - 1
    2**64 - 1
  end
end