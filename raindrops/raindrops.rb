module Raindrops
  @rain = {3 => "Pling", 5 => "Plang", 7 => "Plong"}

  def self.convert(value)
    plingplangplong = ""
    
    @rain.each {|k,v| plingplangplong += v if value % k == 0}
    
    return value.to_s unless plingplangplong != ""
    plingplangplong
  end
end