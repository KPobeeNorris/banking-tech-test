require 'spec_helper'

describe Account do

  describe 'ability to check balance at the start' do
    it 'should have a starting balance of £0' do
      account = Account.new
      expect(account.balance).to eq 0
    end
  end

  describe 'ability to make a deposit' do
    it 'should allow a customer to make a deposit and return new balance' do
      account = Account.new
      account.deposit(100)
      expect(account.balance).to eq 100
    end
  end

  describe 'ability to make a withdrawal' do
    it 'should allow a customer to make a withdrawal and return new balance' do
      account = Account.new
      account.deposit(100)
      account.withdrawal(100)
      expect(account.balance).to eq 0
    end
  end

end
