class Scrabble
  attr_reader :word
  SCRABBLE_TABLE = { # ingenious hash constant for scoring
    1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
    2 => ["D", "G"],
    3 => ["B", "C", "M", "P"],
    4 => ["F", "H", "V", "W", "Y"],
    5 => ["K"],
    8 => ["J", "X"],
    10 => ["Q", "Z"]
  }

  def initialize(word)
    @word = word
  end

  def score
    return 0 if @word.nil? || @word.empty? # checking for nil or empty
    letters = @word.split.join.upcase.chars # array of scrabble letters
    letters.collect{|c| SCRABBLE_TABLE.find{|k,v| v.include?(c)}.first}.sum # collecting numbers for letters and adding up the score
  end

  instance_eval do # because we really need a "static method" too
    def score(word)
      Scrabble.new(word).score
    end
  end
end