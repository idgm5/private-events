require 'rails_helper'

RSpec.describe User, type: :model do 
    fixtures :users

    before(:context) do 
        #@user1001 = User.create!(name: "User1001")
        @user = users(:first)
    end

    it "Have the name" do 
        expect(@user).to be_valid
    end
end