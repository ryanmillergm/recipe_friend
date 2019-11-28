class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    auth = request.env["omniauth.auth"]
    if auth && auth[:provider] != "facebook"
      if user = User.find_by(google_uid: auth.uid)
        session[:user_id] = user.id
        redirect_to dashboard_path
      else
        google_login(auth)
      end
    elsif auth && auth[:provider] == "facebook"
      facebook_login(auth)
    else
      user = User.find_by(email: login_params[:email])
      if user&.authenticate(login_params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user.id)
      else
        flash[:error] = 'Oops! Looks like your email or password is invalid'
        render :new
      end
    end
  end

  def destroy
    session.destroy
    flash[:success] = "You have successfully logged out."
    redirect_to new_session_path
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

  def facebook_login(auth)
    if user = User.find_by(uid: auth.uid)
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      user = User.new(uid: auth.uid)
      user.first_name = auth.info.name.split.first
      user.last_name = auth.info.name.split.last
      user.username = auth.info.name
      user.facebook_token = auth.credentials.token
      user.email = auth.info.email
      user.email_confirmed = true
      user.confirm_token = nil
      # user.telephone = 5555555555
      user.password = "password"
      if user.save
        session[:user_id] = user.id
        redirect_to edit_user_path(user)
      else
        flash[:danger] = user.errors.full_messages
        render :new
      end
    end
  end

  def google_login(auth)
    user = User.new(google_uid: auth.uid)
    user.first_name = auth.info.first_name
    user.last_name = auth.info.last_name
    user.username = auth.info.first_name
    user.google_token = auth.credentials.token
    user.email = auth.info.email
    user.email_confirmed = true
    user.confirm_token = nil
    # user.telephone = 5555555555
    user.password = "password"
    if user.save
      session[:user_id] = user.id
      redirect_to edit_user_path(user)
    else
      flash[:danger] = user.errors.full_messages
      render :new
    end
  end
end
