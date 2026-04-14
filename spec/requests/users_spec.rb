require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "User Registration" do
    it "allows a user to sign up with CUHK email" do
      expect {
        post user_registration_path, params: { 
          user: { 
            email: "new_student@link.cuhk.edu.hk", 
            password: "password123", 
            password_confirmation: "password123" 
          } 
        }
      }.to change(User, :count).by(1)
      expect(response).to redirect_to(root_path)
    end

    it "fails to sign up with invalid email" do
      post user_registration_path, params: { 
        user: { email: "hacker@gmail.com", password: "password" } 
      }
      expect(response.body).to include("must be a valid CUHK email address")
    end
  end
end