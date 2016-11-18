class JourneyLog

  attr_reader :journeys

  def initialize(journey_klass)
    @journey_class = journey_klass
    @journeys = []
  end

  def start(entry_station)
    journey = @journey_class.new
    journey.register_entry_station(entry_station)
    @journeys << journey
  end

  def current_journey
    if @journeys.last.complete? then
       @journey_class.new
    else
      return @journeys.last
    end
  end

  def finish(exit_station)
    current_journey.register_exit_station(exit_station)
  end

end
