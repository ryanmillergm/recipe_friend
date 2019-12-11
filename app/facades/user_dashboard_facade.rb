class UserDashboardFacade
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def find_friend(user, friend)
    @friend = Friend.where(user_id: user.id).find_by(friend_id: friend.id)
  end
end
