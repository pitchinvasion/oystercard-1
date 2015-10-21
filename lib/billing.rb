class Billing
  ZONE_TARRIF = 1
  NUMBER_OF_ZONES = 6

  def initialize(journey_log, oyster_accounts)
    @journey_log = journey_log
    @oyster_accounts = oyster_accounts
  end

  def process
    journey_log.journeys.each do |user_journeys|
      charge(user_journeys[:uuid], user_journeys[:journeys])
    end
  end

  private

  attr_reader :journey_log, :oyster_accounts

  def charge(uuid, journeys)
    amount = journeys.map do |journey|
      zones_travelled(journey)
    end.reduce(&:+) * ZONE_TARRIF
    oyster_accounts.debit(uuid, amount)
  end

  def zones_travelled(journey)
    return NUMBER_OF_ZONES unless journey[:start] && journey[:end]

    (journey[:start].zone - journey[:end].zone).abs + 1
  end
end
