class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: login_params[:email])
    if user&.authenticate(login_params[:password])
      session[:user_id] = user.id
      redirect_to user_show_path
    else
      flash[:error] = 'Oops! Looks like your email or password is invalid'
      render :new
    end
  end

  private

  def login_params
    params.require(:session).permit(:email, :password)
  end
end
