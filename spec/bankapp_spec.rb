require 'spec_helper'

describe Account do

  describe 'ability to check balance at the start' do
    it 'should have a starting balance of £0' do
      account = Account.new
      expect(account.balance).to eq 0
    end
  end
end
