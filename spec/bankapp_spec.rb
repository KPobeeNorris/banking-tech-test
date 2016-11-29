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
      account.transaction('14/02/12', 'credit', 300)
      expect(account.balance).to eq 300
    end
  end

  context 'ability to make a withdrawal' do
    it 'should allow a customer to make a withdrawal and return new balance' do
      account.transaction('14/03/12', 'debit', 300)
      expect(account.balance).to eq 0
    end
  end

  context 'ability to make a deposit and specify the date this was done' do
    it 'should allow a customer to make a deposit and log the date completed' do
      account = Account.new
      account.transaction('14/01/12', 'credit', 100)
      expect(account.transactions).to include date: '14/01/12', type: 'credit', amount: 100
    end
  end
end

describe 'statement' do

  context 'customers want to view their transactions' do
    it 'should allow customers to see their transactions' do
      account = Account.new
      account.transaction('16/05/12', 'credit', 300)
      expect(account.print_transaction[0]).to eq({:date=>"16/05/12", :type=>"credit", :amount=>300})
      end
    end
  end
