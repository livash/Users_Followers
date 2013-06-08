class FollowingsController < ApplicationController
  before_filter :verify?
  
  def index
    @users = User.all
    @followings = Following.all
    @user = current_user
    @followed_users = current_user.followed_users.map do |record|
      id = record.followed_user_id
      User.find(id)
    end
  end
  def new
    
  end
  def create
    @following = Following.new(:followed_user_id => params[:user_id].to_i, :follower_id => current_user.id)
    @following.save!
    redirect_to :back
  end
  def update
    
  end
  def show
    
  end
  def destroy
    @following = Following.where(:followed_user_id => params[:user_id].to_i, :follower_id => current_user.id).first
    if @following.destroy
      redirect_to :back
    else
      redirect_to :back
    end
  end
end
