class UsersController < ApplicationController

  def show
    binding.pry
    render locals: {
      facade: UserDashboardFacade.new(current_user)
    }
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      ready_messages
      redirect_to verify_email_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :username,
                                 :password,
                                 :password_confirmation,
                                 :email,
                                 :avatar,
                                 :about,
                                 :telephone)
  end

  def ready_messages
    flash[:message] = "#{@user.username}'s account has been created"
    flash[:success] = 'This account has not yet been activated. Please check your email.'
  end
end
