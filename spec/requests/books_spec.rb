require 'rails_helper'

RSpec.describe "Books", type: :request do
  let(:user) { User.create!(email: "test@link.cuhk.edu.hk", password: "password123") }
  
  let(:valid_attributes) {
    {
      title: "Algorithm Guide",
      author: "CLRS",
      price: 250,
      condition: "Good",
      location: "United College"
    }
  }

  before do
    sign_in user 
  end

  let!(:book) { Book.create!(valid_attributes.merge(user: user)) }

  describe "GET /index" do
    it "returns a successful response" do
      get "/books"
      expect(response).to be_successful
      expect(response.body).to include("Algorithm Guide")
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get "/books/#{book.id}"
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Book and redirects" do
        expect {
          post "/books", params: { book: valid_attributes }
        }.to change(Book, :count).by(1)
        expect(response).to redirect_to(book_path(Book.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Book and returns unprocessable_entity" do
        post "/books", params: { book: valid_attributes.merge(title: "") }

        expect(Book.count).to eq(1)
        expect(response).to have_http_status(:unprocessable_entity) 
      end
    end
  end

describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the requested book" do
        patch "/books/#{book.id}", params: { book: { title: "New Title" } }
        book.reload
        expect(book.title).to eq("New Title")
        expect(response).to redirect_to(book_path(book))
      end
    end

    context "with invalid parameters" do
      it "returns unprocessable_entity" do
        patch "/books/#{book.id}", params: { book: { title: "" } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested book" do
      expect {
        delete "/books/#{book.id}"
      }.to change(Book, :count).by(-1)
      expect(response).to redirect_to(books_path)
    end
  end

  describe "Authorization" do
  it "redirects unauthorized users" do
    other_user = User.create!(email: "other@link.cuhk.edu.hk", password: "password")
    other_book = Book.create!(valid_attributes.merge(user: other_user))
    
    sign_in user
    
    patch "/books/#{other_book.id}", params: { book: { title: "Hacked" } }
    
    expect(response).to redirect_to(root_path) 
  end
end

end