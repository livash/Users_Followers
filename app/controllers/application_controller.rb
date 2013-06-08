require 'securerandom'

class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def verify?
    return false if current_user.nil?
    current_user.session_token == session[:session_token]
  end
  
  def current_user
    if session[:session_token]
      return User.find_by_session_token(session[:session_token])
    end
    
    nil
  end
  
  def issue_new_session_token!
    SecureRandom.base64(32)
  end
  
  def scramble(password)
    password
  end
end
