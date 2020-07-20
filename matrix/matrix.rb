class Matrix

  attr_reader :matrix, :rows, :columns

  def self.to_i(matrix)
    set1 = matrix.split("\n") #set of strings corresponding to rows
    number_matrix = [] #initializing the number matrix

    set1.each do |set|
      set2 = set.split(" ") #splitting each string row into a set of numbers as strings  
      set2.map! {|v| v.to_i} #converting the obtained set of numbers as strings into actual numbers
      number_matrix << set2 #adding a row to the number matrix 
    end

    number_matrix #returning the number matrix
  end

  def initialize(matrix)
    @matrix = Matrix.to_i(matrix) #upon initialization, we convert the string into a numeric matrix
    @rows = []
    @columns = []
  end

  def rows
    @rows = @matrix #returning the number matrix as rows
  end

  def columns

    for i in 0..(@matrix[0].size-1) #for each column
      each_column = [] #we initialize an array
      
      @matrix.each do |row| #and from each row
        each_column << row[i] #we take the ellement corresponding to our current column
      end
      
      @columns << each_column #finally we add another column
    end
    
    @columns #returning the number matrix as columns
  end

end