class OysterAccounts
  def initialize()
    @accounts = {}
  end

  def open_account(uuid)
    accounts[uuid] = 0
  end

  def credit(uuid, amount)
    raise AccountInvalid unless accounts[uuid]

    accounts[uuid] += amount
  end

  def debit(uuid, amount)
    raise AccountInvalid unless accounts[uuid]

    accounts[uuid] -= amount
  end

  def balance(uuid)
    accounts[uuid]
  end

  private

  attr_reader :accounts

end

class AccountInvalid < StandardError; end
