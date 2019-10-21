class Dashboard::BaseController < ApplicationController
  before_action :require_registered_user

  def require_registered_user
    if current_user
      @user = current_user
    else
      flash[:message] = 'You must log in or register to become a member'
      redirect_to new_session_path
    end
  end
end
