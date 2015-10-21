class JourneyLog
  attr_reader :journeys

  def initialize
    @journeys = {}
  end

  def start_journey(uuid, station)
    journeys[uuid] ||= []
    journeys[uuid] << { start: station }
  end

  def end_journey(uuid, station)
    journeys[uuid].last[:end] = station
  end
end
