require 'spec_helper'
require 'billing'

describe Billing do
  subject(:billing) { described_class.new(journey_log, oyster_accounts) }
  let(:oyster_accounts) { instance_double("OysterAccounts", debit: nil) }
  let(:zone1_station) { instance_double("Station", zone: 1) }
  let(:zone2_station) { instance_double("Station", zone: 2) }
  let(:journey_log) { instance_double("JourneyLog", journeys: journeys) }

  context "with one zone travelled" do
    let(:journeys) do
      [
        {
          uuid: "123",
          journeys: [{start: zone1_station, end: zone1_station}]
        }
      ]
    end 

    let(:expected_charge) { 1 }

    it "charges the account the price for 1 zone journey" do
      subject.process

      expect(oyster_accounts).to have_received(:debit).with("123", expected_charge)
    end
  end

  context "with two zones travelled" do
    let(:journeys) do
      [
        {
          uuid: "123",
          journeys: [{start: zone1_station, end: zone2_station}]
        }
      ]
    end 

    let(:expected_charge) { 2 }

    it "charges the account the price for 1 zone journey" do
      subject.process

      expect(oyster_accounts).to have_received(:debit).with("123", expected_charge)
    end
  end

  context "with a mix of zones travelled" do
    let(:journeys) do
      [
        {
          uuid: "123",
          journeys: [{start: zone1_station, end: zone1_station}, {start: zone1_station, end: zone2_station}]
        }
      ]
    end 

    let(:expected_charge) { 3 }

    it "charges the account the price for 1 zone journey" do
      subject.process

      expect(oyster_accounts).to have_received(:debit).with("123", expected_charge)
    end
  end

  context "with an unfinished journey" do
    let(:journeys) do
      [
        {
          uuid: "123",
          journeys: [{start: zone1_station}]
        }
      ]
    end 

    let(:expected_charge) { 6 }

    it "charges the account the price for 6 zone journey" do
      subject.process

      expect(oyster_accounts).to have_received(:debit).with("123", expected_charge)
    end
  end
end
