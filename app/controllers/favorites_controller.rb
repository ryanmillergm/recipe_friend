class FavoritesController < ApplicationController
  def index
    @user = current_user
    check_logged_in
    
  end

  private

  def check_logged_in
    if current_user.nil?
      flash[:message] = 'You must log in or register to become a member'
      redirect_to new_session_path
    end
  end
end
