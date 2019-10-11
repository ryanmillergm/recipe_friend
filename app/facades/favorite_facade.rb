class FavoriteFacade
  def initialize(user)
    @user = user
  end
  
  def favorites
    Favorite.where(user_id: @user.id).limit(4)
  end
end
