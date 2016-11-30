require_relative 'statement'

class Account

  attr_reader :balance, :transactions

  def initialize
    @balance = 0
    @statement = Statement.new
  end

  def transaction(date, type, amount)
    type == 'credit' ? @balance += amount : @balance -= amount
    balance = @balance
    @statement.new_transaction(date, type, amount, balance)
  end

  def print_statement
    @statement.print_transaction
  end

end
