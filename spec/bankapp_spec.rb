require 'spec_helper'

describe Account do

  account = Account.new

  context 'ability to check balance at the start' do
    it 'should have a starting balance of £0' do
      expect(account.balance).to eq 0
    end
  end

  context 'ability to make a deposit' do
    it 'should allow a customer to make a deposit and return new balance' do
      account.transaction('14/02/2012', 'credit', 300)
      expect(account.balance).to eq 300
    end
  end

  context 'ability to make a withdrawal' do
    it 'should allow a customer to make a withdrawal and return new balance' do
      account.transaction('14/03/2012', 'debit', 300)
      expect(account.balance).to eq 0
    end
  end

  context 'ability to make a deposit and specify the date this was done' do
    it 'should allow a customer to make a deposit and enter the date completed' do
      account = Account.new
      account.transaction('14/01/2012', 'credit', 100)
      expect(account.transactions).to include date: '14/01/2012', type: 'credit', amount: 100, balance: 100
    end
  end
end

describe 'statement' do

  context 'customers want to view their transactions' do
    it 'should allow customers to see a transaction' do
      account = Account.new
      account.transaction('16/05/2012', 'credit', 300)
      expect(account.print_transaction[0]).to eq({:date=>"16/05/2012", :type=>"credit", :amount=>300, :balance=>300})
    end
  end

  context 'customers want to view their transactions' do
    it 'should allow customers to see all their transactions' do
      account = Account.new
      account.transaction('14/01/2012', 'credit', 100)
      account.transaction('16/05/2012', 'credit', 300)
      expect(account.print_transaction).to eq([{:date=>"16/05/2012", :type=>"credit", :amount=>300, :balance=>400}, {:date=>"14/01/2012", :type=>"credit", :amount=>100, :balance=>100}])
    end
  end

end
