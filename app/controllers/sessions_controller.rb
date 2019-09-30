class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: login_params[:email])
    if user&.authenticate(login_params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      flash[:error] = 'Oops! Looks like your email or password is invalid'
      render :new
    end
  end

  def destroy
    session.destroy
    flash[:success] = "You have successfully logged out."
    redirect_to root_path
  end

  private

  def login_params
    params.require(:session).permit(:email, :password)
  end

  def confirm_email
    @user = User.find_by_confirm_token(params[:id])
    if @user
      @user.email_activate
      redirect_to user_path(@user.id)
    else
      flash[:error] = 'Sorry, User does not exist'
      redirect_to root_url
    end
  end
end