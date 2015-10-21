require 'spec_helper'
require 'ticket_machine'

describe TicketMachine do
  let(:card) { instance_double("OysterCard", uuid: "123") }
  let(:oyster_accounts) { instance_double("OysterAccounts", credit: nil, balance: amount, open_account: nil) }
  let(:amount) { 1000 }
  subject(:ticket_machine) { TicketMachine.new(oyster_accounts, OysterCard) }

  describe "issuing oyster card" do
    before do
      allow(OysterCard).to receive(:new).and_return(card)
    end

    it "can create a new card" do
      expect(ticket_machine.buy_card("Joe")).to eq(card)
    end

    it "creates a new account" do
      ticket_machine.buy_card("Joe")

      expect(oyster_accounts).to have_received(:open_account).with(card.uuid)
    end
  end

  it "can top up an oystercard account" do
    ticket_machine.top_up(card, amount)

    expect(oyster_accounts).to have_received(:credit).with(card.uuid, amount)
  end

  it "can check the balance of a card" do
    expect(ticket_machine.balance(card)).to eq(amount)
  end
end
