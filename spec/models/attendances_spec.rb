require 'rails_helper'

RSpec.describe Attendance, type: :model do
  context 'validation tests' do
    fixtures :users, :events, :attendances

    before :each do
      @user = users(:first)
      @event = @user.events_as_creator.build(description: 'lorem ipsum.', event_date: Time.now)
      @attendance = Attendance.new(user_id: @user.id, event_id: @event.id)
    end

    it 'should reject when not given anything' do
      @attendance = Attendance.new
      expect(@attendance.valid?).to eql(false)
    end

    it 'user_id should be present' do
      @attendance.user_id = nil
      expect(@attendance).to_not be_valid
    end

    it 'event_id should be present' do
      @attendance.event_id = nil
      expect(@attendance).to_not be_valid
    end
  end
end
