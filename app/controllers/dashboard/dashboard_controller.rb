class Dashboard::DashboardController < ApplicationController
  def index
    if current_user
      @user = current_user
      @favorites_facade = FavoriteFacade.new(@user)
    else
      flash[:message] = 'You must log in or register to become a member'
      redirect_to new_session_path
    end
  end
end
