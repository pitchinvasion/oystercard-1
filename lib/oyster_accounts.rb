class OysterAccounts
  def initialize()
    @accounts = {}
  end

  def credit(uuid, amount)
    accounts[uuid] ||= 0
    accounts[uuid] += amount
  end

  def balance(uuid)
    accounts[uuid]
  end

  private

  attr_reader :accounts
end
