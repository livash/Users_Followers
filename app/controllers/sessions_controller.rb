class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    @user = User.find_by_username(params[:user][:username])
    #compare passwords
    if @user.scrambled_password == scramble(params[:user][:password])
      @user.session_token = issue_new_session_token!
      @user.save!
      session[:session_token] = @user.session_token
      redirect_to user_url(@user)
    else
      redirect_to new_sessions_url
    end
  end
  
  def destroy
    if verify?
      user = current_user
      user.session_token = nil
      user.save!
      session[:session_token] = nil
      render :good_bye
    else
      redirect_to new_sessions_url
    end
  end
end
