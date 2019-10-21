class Dashboard::MyRecipesController < Dashboard::BaseController
  def index
    @my_recipes = Recipe.my_recipes(@user.id)
  end

  def show
    @user = current_user
  end
end
