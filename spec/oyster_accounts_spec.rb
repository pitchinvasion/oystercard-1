require 'spec_helper'
require 'oyster_accounts'

describe OysterAccounts do
  let(:uid) { "123" }
  let(:amount) { 1000 }
  subject(:oyster_accounts) { described_class.new }

  it "can credit an oyster account" do
    oyster_accounts.credit(uid, amount)

    expect(oyster_accounts.balance(uid)).to eq(amount)
  end
end
