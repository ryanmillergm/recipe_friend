class Dashboard::MyRecipesController < Dashboard::BaseController
  def index
    @my_recipes = Recipe.my_recipes(@user.id)
    @recipes_facade = RecipeFacade.new(@recipes)
  end

  def show
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @recipes_facade = RecipeFacade.new(@recipes)
  end
end
