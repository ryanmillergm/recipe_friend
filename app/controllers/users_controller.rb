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
      UserMailerAwsSdk.registration_confirmation_aws(@user).deliver
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
    if user
      user.email_activate
      flash[:message] = 'Thanks for confirming your email address! You now have full access.'
      redirect_to user_path(user.id)
    else
      flash[:error] = 'Sorry, User does not exist'
      redirect_to root_url
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      if params[:user][:avatar].present?
        render '/crop_images/new'
      elsif params[:user][:background_image].present?
        render '/crop_images/show'
      else
        flash[:success] = "Your profile has been updated"
        redirect_to dashboard_my_profile_path(@user.id)
      end
    else
      flash[:error] = "Oops! Something went wrong"
      redirect_to edit_dashboard_my_profile_path(@user.id)
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
                                 :about,
                                 :telephone,
                                 :location,
                                 :quote,
                                 :avatar,
                                 :background_image,
                                 :crop_x,
                                 :crop_y,
                                 :crop_w,
                                 :crop_h)
  end

  def ready_messages
    flash[:message] = "#{@user.username}'s account has been created"
    flash[:success] = 'A confirmation email has been sent. To gain full access, please confirm your email. Thanks!'
  end
end
