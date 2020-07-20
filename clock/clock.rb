class Clock
  attr_accessor :hour, :minute
  # just algorithmic calculation
  def initialize(hour: 0, minute: 0)
    @hour = (hour + minute/60)%24
    @minute = minute%60
  end

  def to_s
    # proper format
    '%02d%s%02d' % [@hour, ":", @minute]
  end
  def ==(clock)
    @hour == clock.hour && @minute == clock.minute
  end
  def +(clock)
    @hour = (@hour + clock.hour + (@minute + clock.minute)/60)%24
    @minute = (@minute + clock.minute)%60
    self
  end
  def -(clock)
    @hour = (@hour - clock.hour + (@minute - clock.minute)/60)%24
    @minute = (@minute - clock.minute)%60
    self
  end
end