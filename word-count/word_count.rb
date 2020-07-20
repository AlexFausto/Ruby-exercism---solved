class Phrase 
  attr_reader :phrase

  def initialize(phrase)
    @phrase = phrase.downcase.scan(/\b[\w']+\b/) #because we only need the words, not the whole phrase
  end

  def word_count
    words_hash = {} #our desired hash
    
    @phrase.each do |word|
    #iterating through the array and building the hash word by word
      if words_hash.key?(word)
        words_hash[word] += 1
      else
        words_hash[word] = 1
      end  
    
    end
    
    words_hash
  end
end