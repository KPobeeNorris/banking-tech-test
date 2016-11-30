require_relative 'bankapp'

class Statement

  def initialize
    @transactions = []
  end

  def new_transaction(date, type, amount, balance)
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
