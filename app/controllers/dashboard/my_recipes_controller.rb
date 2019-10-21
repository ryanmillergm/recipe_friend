class Dashboard::MyRecipesController < ApplicationController
  def index
    if current_user
      @user = current_user
      @my_recipes = Recipe.my_recipes(@user.id)
    else
      flash[:message] = 'You must log in or register to become a member'
      redirect_to new_session_path
    end
  end
end
