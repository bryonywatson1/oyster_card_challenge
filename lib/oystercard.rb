require_relative './journey'

class OysterCard
  MAXIMUM_LIMIT = 90
  MINIMUM_LIMIT = 1

  attr_reader :balance, :journey_klass

  def initialize(journey)
    @balance = 0
    @journey_klass = journey.new
  end

  def top_up(value)
    raise "Cannot top up: £#{MAXIMUM_LIMIT} limit would be exceeded" if limit_exceeded?(value)
    self.balance += value
  end


  def touch_in(entry_station)
    raise "Error: Insufficient balance, please top up." if insufficient_funds?
    journey_klass.ongoing? ? deduct(PENALTY_FARE) : journey_klass.register_entry_station(nil)
    journey_klass.register_entry_station(entry_station)
  end

  def touch_out(exit_station)
    journey_klass.ongoing? ? deduct(MINIMUM_FARE) : deduct(PENALTY_FARE)
    journey_klass.register_exit_station(exit_station)
  end



  private

  attr_writer :balance

  def limit_exceeded?(value)
    self.balance + value > MAXIMUM_LIMIT
  end

  def insufficient_funds?
    self.balance < MINIMUM_LIMIT
  end

  def deduct(value)
    self.balance -= value
  end

end
