class Journey

  attr_reader :journey_history, :entry_station, :exit_station

  MINIMUM_FARE = 1
  PENALTY_FARE = 6
  def initialize
    @entry_station = nil
    @exit_station = nil
    @journey_history = []
  end

  def ongoing?
    !!entry_station
  end

  def complete?
    self.entry_station && self.exit_station
  end

  def register_entry_station(station)
    self.entry_station = station
  end

  def register_exit_station(station)
    self.exit_station = station
  end

  def forget_entry_station
    self.entry_station = nil
  end

  def fare
    if complete? then MINIMUM_FARE
    else PENALTY_FARE end
  end

  private
  attr_writer :journey_history, :entry_station, :exit_station

end
