class Account

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def transaction(date, type, amount)
    amount.to_f
    type == 'credit' ? @balance += amount : @balance -= amount
    balance = @balance
    @transactions.unshift(date: date, type: type, amount: amount, balance: balance)
  end

  def print_header
    puts "date       || credit || debit    || balance "
    puts "---------------------------------------------"
  end

  def print_transaction
    print_header
    @transactions.each do |transaction|
      if transaction[:type] == 'credit'
        puts "#{transaction[:date]} ||£#{transaction[:amount]}  ||          || £#{transaction[:balance]}"
      else
        puts "#{transaction[:date]} ||        ||£#{transaction[:amount]}    || £#{transaction[:balance]}"
      end
    end
  end

end
