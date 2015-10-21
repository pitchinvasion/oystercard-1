class Station
  def initialize(zone, name, journey_log)
    @journey_log = journey_log
  end

  def touch_in(card)
    journey_log.start_journey(card.uuid, self)
  end

  def touch_out(card)
    journey_log.end_journey(card.uuid, self)
  end

  private

  attr_reader :journey_log
end
