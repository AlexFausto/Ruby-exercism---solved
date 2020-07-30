class Integer
  # integer digits mapped to roman literals 
  DIGITS = {0 => "", 1 => "I", 2 => "II", 3 => "III", 4 => "IV",
            5 => "V", 6 => "VI", 7 => "VII", 8 => "VIII", 9 => "IX"}

  TENS = {0 => "", 1 => "X", 2 => "XX", 3 => "XXX", 4 => "XL",
          5 => "L", 6 => "LX", 7 => "LXX", 8 => "LXXX", 9 => "XC"}

  HUNDREDS = {0 => "", 1 => "C", 2 => "CC", 3 => "CCC", 4 => "CD",
              5 => "D", 6 => "DC", 7 => "DCC", 8 => "DCCC", 9 => "CM"}

  THOUSANDS = {1 => "M", 2 => "MM", 3 => "MMM"}

  def to_roman
    # we only need to parse the number 
    # through the above dictionaries
    # digit by digit
    case self
    when 0..9
      DIGITS[self]
    when 10..99
      TENS[self/10] + DIGITS[self%10]
    when 100..999
      HUNDREDS[self/100] + TENS[(self%100)/10] + DIGITS[self%10]
    when 1000..3000
      THOUSANDS[self/1000] + HUNDREDS[(self%1000)/100] +
      + TENS[(self%100)/10] + DIGITS[self%10]
    else
      DIGITS[0]
    end
  end
end