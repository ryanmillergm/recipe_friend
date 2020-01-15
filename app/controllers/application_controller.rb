class ApplicationController < ActionController::Base
  helper_method :current_user, :require_registered_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  

  def require_registered_user
    if current_user
      @user = current_user
    else
      flash[:message] = 'You must log in or register to become a member'
      redirect_to new_session_path
    end
  end

  # def render_not_found
  #   render file: 'public/404', status: 404
  # end
end
