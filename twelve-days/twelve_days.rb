module TwelveDays
  DAYS = "first second third fourth fifth sixth seventh eighth ninth tenth eleventh twelfth".split
  GIFTS = "twelve Drummers Drumming, eleven Pipers Piping, ten Lords-a-Leaping, nine Ladies Dancing, eight Maids-a-Milking, seven Swans-a-Swimming, six Geese-a-Laying, five Gold Rings, four Calling Birds, three French Hens, two Turtle Doves, a Partridge in a Pear Tree".split(", ").reverse
  VERSE = "On the X day of Christmas my true love gave to me: "
  def self.song
    sing = ""
    for i in 0..11 do
      # The current verse
      sentence = VERSE.sub 'X', DAYS[i] 
      # The first verse doesn't have 'and '
      sentence += GIFTS[0] unless i>0
      # Adding gifts in reverse order
      GIFTS[1, i].reverse.each {|g| sentence += g + ", "}
      # Adding 'and ' before the last gift
      sentence += "and " + GIFTS[0] unless i == 0
      # Two new lines at the end
      sentence += ".\n\n" unless i == 11  
      # The last verse finishes with one new line
      sentence += ".\n" if i == 11 
      # Adding the current verse to the song
      sing += sentence
    end
    sing
  end
end