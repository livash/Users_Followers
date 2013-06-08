class UsersController < ApplicationController
  before_filter :verify?, :except => :new
  
  # def index
  #   
  # end
  
  def new
    @user = User.new
  end
  
  def create
    name = params[:user][:name]
    username = params[:user][:username]
    @user = User.new(:name => name, :username => username)
    @user.scrambled_password = scramble(params[:user][:password])
 
    if @user.save!
      @user.session_token = issue_new_session_token!
      @user.save!
      session[:session_token] = @user.session_token
      redirect_to user_url(@user)
    else
      redirect_to new_user_url(@user)
    end
  end
  
  def show
    @user = User.find(params[:id])
    if @user == current_user
      @followed_users = @user.followed_users.map do |record|
        puts "HEre is what WEEEEEEEEEEEE #{record.followed_user_id}"
        id = record.followed_user_id
        User.find(id)
      end
      @followers = @user.followers.map do |record|
        id = record.follower_id
        User.find(id)
      end
    
      render :show
    else
      @user = current_user
      redirect_to user_url(@user)
    end
  end
  
  def update
    
  end
  
  def edit
    
  end
  
  def destroy
    
  end
end
