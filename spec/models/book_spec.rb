require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:user) { User.create!(email: "test@link.cuhk.edu.hk", password: "password123") }
  
  let(:valid_attributes) {
    {
      title: "Introduction to Algorithms",
      author: "CLRS",
      price: 250.5,
      condition: "Good",
      location: "United College",
      user: user
    }
  }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(Book.new(valid_attributes)).to be_valid
    end

    it "is invalid without required fields" do
      [:title, :author, :price, :condition, :location].each do |field|
        book = Book.new(valid_attributes.merge(field => nil))
        expect(book).not_to be_valid
      end
    end

    it "ensures price is non-negative" do
      book = Book.new(valid_attributes.merge(price: -1))
      expect(book).not_to be_valid
    end
  end

  describe "Custom Logic: Geocoding" do
    it "sets correct coordinates for known CUHK locations" do
      book = Book.new(valid_attributes.merge(location: "Shaw College"))
      book.valid? # 触发 before_validation
      
      fail "Latitude was nil! Check your before_validation." if book.latitude.nil?

      book = Book.create!(valid_attributes.merge(location: "Shaw College"))
      expect(book.latitude).to eq(22.4205)
      expect(book.longitude).to eq(114.2079)
    end
  end

  describe "Enums and Scopes" do
    it "defaults to available status" do
      book = Book.create!(valid_attributes)
      expect(book.available?).to be true
    end

    it "filters available books only" do
      Book.create!(valid_attributes.merge(status: :available))
      Book.create!(valid_attributes.merge(status: :sold))
      expect(Book.available_only.count).to eq(1)
    end

    it "filters by price range" do
      Book.create!(valid_attributes.merge(price: 100))
      Book.create!(valid_attributes.merge(price: 500))
      expect(Book.price_between(50, 150).count).to eq(1)
    end
  end
end