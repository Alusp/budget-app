require "rails_helper"

RSpec.describe Purchase, type: :model do
  describe 'Purchase model' do
    before(:each) do
      @user = User.create name: 'Anonymus', email: 'anonymus@anon.co', password: 'password'
    end

    it 'accepts a valid name and amount' do
      purchase = Purchase.create! name: 'Pork ribs', amount: 13, user: @user
      expect(purchase).to_not be_valid
    end

    it 'accepts a valid name, amount and user' do
      purchase = Purchase.create! name: 'Pork ribs', amount: 13, user: @user
      expect(purchase).to_not be_valid
    end

    it 'does not accept an invalid name' do
      purchase = Purchase.create name: '', amount: 13, user: @user
      expect(purchase).to_not be_valid
    end

    it 'does not accept an invalid amount' do
      purchase = Purchase.create name: 'Pork ribs', amount: '', user: @user
      expect(purchase).to_not be_valid
    end

    it 'does not accept an invalid user' do
      purchase = Purchase.create name: 'Pork ribs', amount: 13, user: nil
      expect(purchase).to_not be_valid
    end

    it 'does not accept an invalid name, amount and user' do
      purchase = Purchase.create name: '', amount: '', user: nil
      expect(purchase).to_not be_valid
    end
  end
end