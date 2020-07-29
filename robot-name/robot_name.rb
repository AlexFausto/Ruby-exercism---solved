class Robot
  # all possible names can be stored 
  # as a shuffled range of numbers 
  @@names = (0..675999).to_a.shuffle
  @@LETTERS = ('A'..'Z').to_a
  @name

  def initialize
    # any new Robot name is in fact
    # just a random number in range 
    @name = @@names.pop
  end

  def name
    # when returning the name, we use the following formula
    # to decrypt the desired name from the random number
    @@LETTERS[(@name/1000)/26] + @@LETTERS[(@name/1000)%26] + '%03d'%(@name%1000)
  end
  
  def reset
    # new different random name
    # from the shuffled range 
    @name = @@names.pop
  end

  def self.forget
    # simply rebooting the range 
    # in a new shuffled order
    @@names = (0..675999).to_a.shuffle
  end
  
end