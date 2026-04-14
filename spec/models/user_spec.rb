require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "is valid with a CUHK link email" do
      user = User.new(email: "1155123456@link.cuhk.edu.hk", password: "password123")
      expect(user).to be_valid
    end

    it "is invalid with a Gmail address" do
      user = User.new(email: "someone@gmail.com")
      expect(user).not_to be_valid
      expect(user.errors[:email]).to include("must be a valid CUHK email address")
    end
  end
end