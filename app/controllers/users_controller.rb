class UsersController < ApplicationController

  def show
    @user = current_user
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
      UserMailer.registration_confirmation(@user).deliver
      session[:user_id] = @user.id
      ready_messages
      redirect_to user_path(@user.id)
    else
      flash[:error] = "Ooooppss, something went wrong!"
      render :new
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    binding.pry
    if user
      user.email_activate
      redirect_to user_path(user.id)
    else
      flash[:error] = 'Sorry, User does not exist'
      redirect_to root_url
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
    flash[:success] = 'A confirmation email has been sent. To gain full access, please confirm your email. Thanks!'
  end
end
