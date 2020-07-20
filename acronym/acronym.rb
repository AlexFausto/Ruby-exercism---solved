module Acronym
  
  def self.words(expression)
    expression.split(/\W+/)
  end

  def self.initials(words_array)
    words_array.map! {|word| word[0].upcase}
  end
  
  def self.abbreviate(something)
    almost_done = words(something)
    done = initials(almost_done)
    done.join()
  end

end