class Account

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def transaction(date, type, amount)
    if type == 'credit'
      @balance += amount
    else
      @balance -= amount
    end
    balance = @balance
    add_transaction(date: date, type: type, amount: amount, balance: balance)
  end

  def add_transaction(info)
    @transactions.unshift(info)
  end

  def print_header
    puts "date       || credit   || debit   || balance "
    puts "---------------------------------------------"
  end

  def print_transaction
    print_header
    @transactions.each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:type]} || £#{transaction[:amount]} || £#{transaction[:balance]}"
    end
  end

end
