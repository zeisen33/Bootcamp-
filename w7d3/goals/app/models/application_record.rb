# C H R L L L

class ApplicationRecord < ActiveRecord::Base
  skip_before_action :verify_authenticity_token 

  def current_user
    @current_user ||= User.find_by(session_token:session[:session_token])
  end

  helper_method :current_user, :logged_in?

  def require_logged_in
    if !logged_in?
      redirect_to new_session_url 
    end
  end

  def login!(user)
    session[:session_token] = user.reset_session_token! 
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil 
    @current_user = nil 
  end

  def logged_in?
    !!current_user 
  end

  def require_logged_out
    if logged_in?
      redirect_to users_url
    end
  end
end
