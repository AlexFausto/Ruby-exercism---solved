module Pangram
  def self.pangram?(input)
    # there are 26 letters in the latin alphabet
    input.downcase.scan(/[a-z]/).uniq.size == 26
  end
end