class Dashboard::MyProfileController < Dashboard::BaseController
  before_action :authenticate_user

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  private

  def authenticate_user
    if current_user.id != params[:id].to_i
      flash[:danger] = "Warning! Attempted Breach!"
      redirect_to forbidden_path(params[:id])
    end
  end
end
