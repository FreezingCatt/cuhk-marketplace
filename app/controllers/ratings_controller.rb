class RatingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book

  def create
    @rating = @book.ratings.build(rating_params)
    @rating.user = current_user

    if @rating.save
      redirect_to @book, notice: 'Rating submitted successfully'
    else
      redirect_to @book, alert: @rating.errors.full_messages.to_sentence
    end
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def rating_params
    params.permit(:score, :comment)
  end
end
