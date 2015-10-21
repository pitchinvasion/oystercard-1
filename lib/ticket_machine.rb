class TicketMachine
  def initialize(oyster_accounts)
    @oyster_accounts = oyster_accounts
  end

  def top_up(card, amount)
    oyster_accounts.credit(card.uuid, amount)
  end

  def balance(card)
    oyster_accounts.balance
  end

  private

  attr_reader :oyster_accounts
end
