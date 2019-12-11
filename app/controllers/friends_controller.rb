class FriendsController < ApplicationController
  def create
    @user = current_user
    friendship = Friend.new(user_id: params[:user_id], friend_id: params[:format])
    redirect_to
  end
end
