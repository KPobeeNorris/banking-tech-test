class Account

attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end


def transaction(type, date, amount)
  add_transaction(type: type, date: date, amount: amount)
  if type == 'deposit'
    @balance += amount
  else
    @balance -= amount
  end
end

def add_transaction(info)
  @transactions << info
end

end
