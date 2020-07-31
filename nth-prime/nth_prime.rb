module Prime
  # fastest algorithm I know 
  def self.nth(n)
    # cheking preliminary cases
    raise ArgumentError if n < 1
    return 2 if n == 1
    return 3 if n == 2
    # here we start the real work
    prime = 4; n -= 2
    while n > 0 do
      prime += 1
      flag = true
      # all prime divisors are less than
      # or equal to radical of number 
      for i in 2..Math.sqrt(prime).round
        if prime % i == 0
          # if we found a divisor
          flag = false
          break
        end
      end
      # flag is still true if 
      # there are no divisors
      n -= 1 if flag
    end
    # now n is 0 and 'prime' is 
    # our desired n'th prime
    prime
  end

end