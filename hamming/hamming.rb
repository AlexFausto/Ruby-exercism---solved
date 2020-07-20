module Hamming

  def self.compute(sequence1, sequence2)
    raise ArgumentError unless sequence1.length == sequence2.length 
    
    count = 0
    for i in 0..(sequence1.length)
      count += 1 if sequence1[i] != sequence2[i]
    end
    
    count
  end

end

