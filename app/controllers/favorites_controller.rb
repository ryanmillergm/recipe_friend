class FavoritesController < ApplicationController
  def index
    if current_user
      @user = current_user
      @favorites = Favorite.where(user_id: @user.id)
    else
      flash[:message] = 'You must log in or register to become a member'
      redirect_to new_session_path
    end
  end

  def create
    @user = current_user
    @recipe = Recipe.find(params[:format].to_i)
    @favorite = Favorite.create(favorite_params(@user, @recipe))
    flash[:success] = "#{@recipe.title} has been added to your favorites!"
    redirect_to recipe_path(@recipe.id)
  end

  def destroy
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @favorite = Favorite.where(user_id: @user.id).find_by(recipe_id: @recipe.id)
    @favorite.destroy
    flash[:success] = "#{@recipe.title} has been removed from your favorites!"
    redirect_to recipe_path(@recipe.id)
  end

  private

  def favorite_params(user, recipe)
    fav_params = {
      title: recipe.title,
      user_id: user.id,
      recipe_id: recipe.id
    }
  end
end
