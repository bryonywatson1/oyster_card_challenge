class OysterCard
  MAXIMUM_LIMIT = 90
  attr_reader :balance

  def initialize
    @balance = 0
    @in_use = false
  end

  def top_up(value)
    raise "Cannot top up: £#{MAXIMUM_LIMIT} limit would be exceeded" if (limit_exceeded?(value))
    @balance += value
  end

  def deduct(value)
    @balance -= value
  end

  def touch_in
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  def in_journey?
    in_use
  end

  private
  def limit_exceeded?(value)
    @balance + value > MAXIMUM_LIMIT
  end

  attr_reader :in_use

end
