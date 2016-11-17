class Journey

  attr_reader :journey_history, :entry_station

  def initialize
    @entry_station = nil
    @journey_history = []
  end

  def ongoing?
    !!entry_station
  end

  def register_entry_station(station)
    self.entry_station = station
  end

  def register_journey(exit_station)
    self.journey_history << {entry_station=>exit_station}
  end

  def forget_entry_station
    self.entry_station = nil
  end

  private
  attr_writer :journey_history, :entry_station

end
