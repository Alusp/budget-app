# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Group model' do
    before(:each) do
      @user = User.create name: 'Alusine', email: 'alusine@anon.co', password: 'password'
    end

    it 'accepts a valid name' do
      group = Group.create! name: 'MyName', icon: 'shorturl.at/nxQZ7', user: @user
      expect(group).to be_valid
    end

    it 'accepts a valid icon url' do
      group = Group.create! name: 'MyName', icon: 'shorturl.at/nxQZ7', user: @user
      expect(group).to be_valid
    end

    it 'accepts a valid user' do
      group = Group.create! name: 'MyName', icon: 'shorturl.at/nxQZ7', user: @user
      expect(group).to be_valid
    end

    it 'accepts a valid name, icon and user' do
      group = Group.create! name: 'MyName', icon: 'shorturl.at/nxQZ7', user: @user
      expect(group).to be_valid
    end

    it 'does not accept an invalid icon' do
      group = Group.create name: 'MyName', icon: '', user: @user
      expect(group).to_not be_valid
    end
  end
end
