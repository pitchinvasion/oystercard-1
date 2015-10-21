require 'spec_helper'
require 'station'

describe Station do
  let(:zone) { 1 }
  let(:name) { "Angel" }
  let(:journey_log) { instance_double("JourneyLog", start_journey: nil, end_journey: nil) }
  let(:card) { instance_double("OysterCard", uuid: "123") }
  subject(:station) { described_class.new(zone, name, journey_log) }

  it "can register a touch in" do
    station.touch_in(card)

    expect(journey_log).to have_received(:start_journey).with(card.uuid, station)
  end

  it "can register a touch out" do
    station.touch_out(card)

    expect(journey_log).to have_received(:end_journey).with(card.uuid, station)
  end
end
