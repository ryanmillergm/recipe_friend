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

  def sent_friend_requested
    @sent_requests = Friend.where(user_id: @user.id ).where(confirmed: false, blocked: false)
    @sent_requests.map do |friend|
      User.find(friend.friend_id)
    end
  end

  def friendship_requested(friend)
    possible_friend = nil
    if friendship = Friend.where(user_id: friend.id).where(confirmed: false, blocked: false).find_by(friend_id: @user.id)
      possible_friend = User.find(friendship.user_id)
    end
    possible_friend
  end
end
