class Sieve

  @primes
  @limit

  def initialize(n)
    # no primes yet
    @primes = []
    @limit = n
  end
  # the actual algorithm 
  def eratosthenes
    # a new array with all the numbers
    # as indexes initially marked true
    a = Array.new(@limit+1, true)
    # 0 and 1 are not primes
    a[0] = a[1] = false
    # now we start marking false 
    # the numbers that are multiples
    # of other numbers
    for i in 2..@limit do
      # if it's already marked
      next unless a[i]
      # now a[i] is certainly true
      # and thus i is a prime 
      j = 2
      while i*j <= @limit do
        # all the multiples of i
        # are marked as false 
        a[i*j] = false
        j += 1
      end
    end
    # for the true elements, their indexes
    # are shoved into the primes array
    a.each_with_index{|x,i| @primes << i if x }
  end

  def primes
    # cheking the input
    return [] unless @limit > 1
    # applying the algorithm 
    self.eratosthenes
    # returning the primes in range
    @primes
  end
end