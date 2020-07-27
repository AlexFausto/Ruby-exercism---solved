module Complement
  @@RNA = { "A" => "U",
            "C" => "G",
            "G" => "C",
            "T" => "A" }
  def self.of_dna(dna)
    # easy filter through dictionary
    dna.each_char.map{|x| @@RNA[x]}.join
  end
end