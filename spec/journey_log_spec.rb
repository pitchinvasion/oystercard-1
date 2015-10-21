require 'spec_helper'
require 'journey_log'

describe JourneyLog do
  let(:uuid) { "123" }
  let(:station) { instance_double("Station") }
  subject(:journey_log) { described_class.new }

  it "lists one journey when starting and ending a journey" do
    subject.start_journey(uuid, station)
    subject.end_journey(uuid, station)

    expect(subject.journeys).to eq({ uuid => [{start: station, end: station}]})
  end

  describe "when starting twice" do
    before do
      subject.start_journey(uuid, station)
      subject.start_journey(uuid, station)
    end

    it "lists two journeys" do 
      expect(subject.journeys).to eq({ uuid => [{start: station}, {start: station}]})
    end

    it "ends the second when ending a journey" do 
      subject.end_journey(uuid, station)

      expect(subject.journeys).to eq({ uuid => [{start: station}, {start: station, end: station}]})
    end
  end
end
