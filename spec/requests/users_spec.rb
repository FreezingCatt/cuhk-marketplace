require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "User Registration" do

    it "fails to sign up with invalid email" do
      post user_registration_path, params: { 
        user: { email: "hacker@gmail.com", password: "password" } 
      }
      expect(response.body).to include("must be a valid CUHK email address")
    end
  end
end