class OysterCard
  MAXIMUM_LIMIT = 90
  MINIMUM_LIMIT = 1
  MINIMUM_FARE = 1
  attr_reader :balance, :entry_station, :journey_history

  def initialize
    @balance = 0
    @entry_station = nil
    @journey_history = []
  end

  def top_up(value)
    raise "Cannot top up: £#{MAXIMUM_LIMIT} limit would be exceeded" if limit_exceeded?(value)
    self.balance += value
  end


  def touch_in(entry_station)
    raise "Error: Insufficient balance, please top up." if insufficient_funds?
    self.entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    self.journey_history << {entry_station=>exit_station}
    self.entry_station = nil
  end

  def in_journey?
    !!entry_station
  end

  private

  attr_writer :balance, :entry_station, :journey_history

  def limit_exceeded?(value)
    self.balance + value > MAXIMUM_LIMIT
  end

  def insufficient_funds?
    self.balance < MINIMUM_LIMIT
  end

  def deduct(value)
    self.balance -= value
  end

  attr_reader :in_use

end
