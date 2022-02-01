require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Creation" do
    before do
      @user = User.create(email: "test@tes.com", password: "123123", password_confirmation: "123123", first_name: "Jon", last_name: "Snow" )
    end
    it "can be created" do
      expect(@user).to be_valid
    end

    it "cannot be created wothout first_name, last_name" do
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end
end
