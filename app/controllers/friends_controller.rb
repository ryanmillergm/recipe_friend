class FriendsController < ApplicationController
  def index
    @user = current_user
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
end
