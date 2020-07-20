module Isogram
  def self.isogram?(input)
    work_copy = input.downcase.delete(' -').dup # copy to mess with 
    work_copy == work_copy.chars.uniq.join # checking and returning
  end
end