require 'rails_helper'

RSpec.describe Rating, type: :model do
  it "is valid with valid attributes" do

    user = User.new(email: "test@link.cuhk.edu.hk", password: "password123")

    book = Book.new(title: "Test Book", price: 10, user: user)
    
    rating = Rating.new(score: 5, user: user, book: book) 
    
    expect(rating).to be_valid
  end
end