class RatingsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = User.find(params[:user_id])
    @ratings = @user.ratings_received.recent
  end
  
  def new
    @ratee = User.find(params[:ratee_id]) if params[:ratee_id]
    @rating = Rating.new
  end
  
  def create
    @rating = current_user.ratings_given.build(rating_params)
    if @rating.save
      redirect_to user_ratings_path(@rating.ratee), notice: "Rating submitted successfully"
    else
      render :new
    end
  end
  
  private
  
  def rating_params
    params.require(:rating).permit(:ratee_id, :score, :comment)
  end
end
