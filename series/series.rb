class Series
  attr_reader :serie

  def initialize(serie)
    @serie = serie.chars #better to work with an array than a string
  end

  def slices(n)
    
    if n > @serie.length
      raise(ArgumentError) #taking care of the error case
    end
    
    result = []
    for i in 0..(@serie.length - n) do
      piece_of_cake = @serie.slice(i, n) #we already have a slice function for arrays
      result << piece_of_cake.join
    end
    result
  end
end