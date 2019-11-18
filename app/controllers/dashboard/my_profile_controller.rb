class Dashboard::MyProfileController < Dashboard::BaseController
  def index
    @user = current_user
  end
end
