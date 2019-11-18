class Dashboard::MyProfileController < Dashboard::BaseController
  def show
    @user = current_user
  end
end
