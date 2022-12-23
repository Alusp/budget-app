# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GroupPurchase, type: :model do
  describe 'Group model' do
    before(:each) do
      @user = User.create! name: 'Anonymus', email: 'anonymus@anon.co', password: 'password'
      @group = Group.create! name: 'McGyver', icon: 'shorturl.at/nxQZ7', user: @user
      @purchases = Purchase.create! name: 'Pork ribs', amount: 13, user: @user
    end

    it 'creates a linking table' do
      group_purchase = GroupPurchase.create! purchase_id: @user.id, group_id: @group.id
      expect(group_purchase).to be_valid
    end

    it 'creates a linking table with a group' do
      group_purchase = GroupPurchase.create! purchase_id: @user.id, group_id: @group.id
      expect(group_purchase.group).to eq(@group)
    end

    it 'creates a linking table with an purchase' do
      group_purchase = GroupPurchase.create! purchase_id: @user.id, group_id: @group.id
      expect(group_purchase.purchase).to eq(@purchases)
    end

    it 'creates a linking table with a group and an purchase' do
      group_purchase = GroupPurchase.create! purchase_id: @user.id, group_id: @group.id
      expect(group_purchase.group).to eq(@group)
      expect(group_purchase.purchase).to eq(@purchases)
    end
  end
end
