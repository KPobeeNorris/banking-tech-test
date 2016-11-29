require 'spec_helper'

describe Account do

    account = Account.new

  describe 'ability to check balance at the start' do
    it 'should have a starting balance of £0' do
      expect(account.balance).to eq 0
    end
  end

  describe 'ability to make a deposit' do
    it 'should allow a customer to make a deposit and return new balance' do
      account.transaction('deposit', '14/02/12', 300)
      expect(account.balance).to eq 300
    end
  end

  describe 'ability to make a withdrawal' do
    it 'should allow a customer to make a withdrawal and return new balance' do
      account.transaction('withdrawal', '14/03/12', 300)
      expect(account.balance).to eq 0
    end
  end
end

describe Account do

  describe 'ability to make a deposit and specify the date this was done' do
    it 'should allow a customer to make a deposit and log the date completed' do
      account = Account.new
      account.transaction('deposit', '14/01/12', 100)
      expect(account.balance).to eq 100
      expect(account.transactions).to include type: 'deposit', date: '14/01/12', amount: 100
    end
  end
end
