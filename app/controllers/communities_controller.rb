class CommunitiesController < ApplicationController
  before_action :set_community, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authorize_community!, only: [:edit, :update, :destroy]

  def index
    @communities = Community.active.includes(:owner).page(params[:page]).per(12)
  end

  def show
  end

  def new
    @community = current_user.owned_communities.build
  end

  def create
    @community = current_user.owned_communities.build(community_params)
    if @community.save
      redirect_to @community, notice: 'Community was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @community.update(community_params)
      redirect_to @community, notice: 'Community was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @community.destroy
    redirect_to communities_url, notice: 'Community was successfully deleted.'
  end

  private

  def set_community
    @community = Community.find(params[:id])
  end

  def community_params
    params.require(:community).permit(:name, :description, :rules, :is_public)
  end

  def authorize_community!
    redirect_to @community unless current_user.can_manage_community?(@community)
  end
end
