class Squares
  # instance variable
  @n

  def initialize(n) 
    @n = n
  end
  
  def square_of_sum
    # basic maths
    (@n * (@n + 1) / 2) ** 2 
  end
  
  def sum_of_squares
    # basic maths next level
    @n * (@n + 1) * (2 * @n + 1) / 6
  end

  def difference
    self.square_of_sum - self.sum_of_squares
  end

end