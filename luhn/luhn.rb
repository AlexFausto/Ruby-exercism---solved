module Luhn
  def self.valid?(id)# main method
    # we obtain the digits from the id number
    digits = id.scan(/[0-9]/).collect {|char| char.to_i}
    # we validate the id number
    return false unless Luhn.is_ok?(id, digits.size)
    # we split the digits array in two based on index parity
    digits_0, digits_1 = Luhn.two_arr(digits)
    # we run the actual algorithm formula
    return Luhn.test?(digits_0, digits_1, digits.size)   
  end
  
  def self.is_ok?(id, n)# validation method
    # we obtain the characters from the id number
    valid = id.delete(' ').chars
    # we need more than one digit && all characters to be digits
    n>1 && valid.each {|v| break false unless ('0'..'9').include? v}
  end

  def self.two_arr(one_arr)# splitting method 
    # first array with even index
    a = one_arr.collect.with_index {|d, i| d if i.even?}.compact
    # second array with odd index
    b = one_arr.collect.with_index {|d, i| d unless i.even?}.compact
    return a, b
  end

  def self.test?(arr_even, arr_odd, n)# algorithm formula
    # the index taken into account from right to left
    return (arr_even.map{|d| d*2>9 ? d*2-9 : d*2}.sum + arr_odd.sum)%10 == 0 if n.even?
    (arr_even.sum + arr_odd.map{|d| d*2>9 ? d*2-9 : d*2}.sum)%10 == 0
  end

end