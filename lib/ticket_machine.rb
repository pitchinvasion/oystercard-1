class TicketMachine
  def initialize(oyster_accounts, oyster_card)
    @oyster_accounts = oyster_accounts
    @oyster_card = oyster_card
  end

  def buy_card(name)
    oyster_card.new(name).tap do |card|
      oyster_accounts.open_account(card.uuid)
    end
  end

  def top_up(card, amount)
    oyster_accounts.credit(card.uuid, amount)
  end

  def balance(card)
    oyster_accounts.balance(card.uuid)
  end

  private

  attr_reader :oyster_accounts, :oyster_card
end
