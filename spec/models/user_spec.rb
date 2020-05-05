require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations user test' do
    fixtures :users
    before :each do
      @user = users(:first)
      @user_new = User.create(name: 'User1001')
    end

    it 'should be valid' do
      expect(@user).to be_valid
    end

    it 'should be present' do
      expect(@user_new).to be_present
    end

    it 'name should not be spaces' do
      @user.name = '   '
      expect(@user).to_not be_valid
    end
  end

  context 'Associations user test' do
    it 'has many invites' do
      assc = User.reflect_on_association(:attendances)
      expect(assc.macro).to eq :has_many
    end

    it 'has many events_as_creator' do
      assc = User.reflect_on_association(:events_as_creator)
      expect(assc.macro).to eq :has_many
    end

    it 'has many events_as_guest' do
      assc = User.reflect_on_association(:events_as_guest)
      expect(assc.macro).to eq :has_many
    end
  end
end
