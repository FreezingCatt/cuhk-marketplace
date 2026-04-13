class BooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create, :update, :destroy]
  #before_action :authenticate_user!, except: [:index, :show]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @q = Book.available_only.ransack(params[:q])
    @books = @q.result(distinct: true).includes(:user).order(created_at: :desc)
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = User.first
    if @book.save
      redirect_to @book, notice: 'Book listed successfully'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book updated successfully'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Book removed'
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :price, :condition, :location, :status)
  end
end