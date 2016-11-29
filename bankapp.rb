class Account

attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end


def transaction(date, type, amount)
  add_transaction(date: date, type: type, amount: amount)
  if type == 'credit'
    @balance += amount
  else
    @balance -= amount
  end
end

def add_transaction(info)
  @transactions << info
end

def print_transaction
  @transactions.each do |transaction|
     puts "Date: #{transaction[:date]} || Type: #{transaction[:type]} || Amount: £#{transaction[:amount]}".center(100)
  end
end

end
