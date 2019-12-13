class FriendsController < ApplicationController
  def index
    @user = current_user
    @user_facade = UserDashboardFacade.new(@user)
  end

  def create
    @user = current_user
    @uathor = User.find(params[:format])
    friendship = Friend.new(user_id: params[:user_id], friend_id: params[:format])
    if friendship.save
      redirect_to user_friends_path(@user)
    else
      redirect_to user_path(@author)
    end
  end

  def update
    @user = current_user
    @friendship = Friend.where(friend_id: @user.id).find_by(user_id: params[:id])
    @friend = User.find(@friendship.user_id)
    if params[:format] == "accept"
      @friendship.update(confirmed: true)
      @user.friends << @friend
      new_friendship = Friend.where(friend_id: @friend.id).find_by(user_id: @user.id)
      new_friendship.update(confirmed: true)
      redirect_to user_friends_path(@user)
    elsif params[:format] == "decline"
      @friendship.destroy
      redirect_to user_friends_path(@user)
    else
      flash[:danger] = "Oops. Something went wrong."
      redirect_to user_friends_path(@user)
    end
  end

  def destroy
    @user = current_user
    friend = User.find(params[:id])
    @user_facade = UserDashboardFacade.new(@user)
    friendship = @user_facade.find_friend(@user, friend)
    flash[:success] = "#{friend.username} has been removed from your friends list"
    if friendship.confirmed == false
      friendship.destroy
      redirect_to user_friends_path(@user)
    else
      friendship.destroy
      their_friendship = @user_facade.find_friend(friend, @user)
      their_friendship.destroy
      redirect_to user_friends_path(@user)
    end
  end
end
