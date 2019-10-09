class FavoritesController < ApplicationController
  def index
    @user = current_user
    check_logged_in
  end

  def create
    @user = current_user
    @recipe = Recipe.find(params[:format].to_i)
    @favorite = Favorite.create(favorite_params(@user, @recipe))
    flash[:message] = "#{@recipe.title} has been added to your favorites!"
    redirect_to recipe_path(@recipe.id)
  end

  private

  def check_logged_in
    if current_user.nil?
      flash[:message] = 'You must log in or register to become a member'
      redirect_to new_session_path
    end
  end

  def favorite_params(user, recipe)
    fav_params = {
      user_id: user.id,
      recipe_id: recipe.id
    }
  end
end
