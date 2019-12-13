class UserDashboardFacade
  attr_reader :user

  def initialize(user)
    @user = user
  end

  def find_friend(user, friend)
    @friend = Friend.where(user_id: user.id).find_by(friend_id: friend.id)
  end

  def pending_friend_requests
    @friend_requests = Friend.where(friend_id: @user.id ).where(confirmed: false, blocked: false)
    @friend_requests.map do |friend|
      User.find(friend.user_id)
    end
  end

  def confirmed_friends
    @friends = []

    group1 = Friend.where(user_id: @user.id).where(confirmed:true)

    if !group1.empty?
      group1.each do |friend|
        user = User.find(friend.friend_id)
        @friends << user
      end
    end

    @friends
  end
end
