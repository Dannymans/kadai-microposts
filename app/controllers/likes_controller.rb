class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @likes = Like.all.page(params[:page])
  end

  def show
    @like = Like.find(params[:id])
  end

  def new
    @like = Like.new
  end

  def create
    micropost = Micropost.find(params[:micropost])
    current_user.like(micropost)
    flash[:success] = 'お気に入りしました。'
  end

  def destroy
    micropost = Micropost.find(params[:micropost])
    current_user.unlike(micropost)
    flash[:success] = 'お気に入りを解除しました。'
  end  
end
