class RecipesController < ApplicationController
  def index
    @recipes = Recipe.get_recipes(search_params)
  end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipes_facade = RecipeFacade.new(@recipes)
  end

  def create
    @user = current_user
    @recipe = Recipe.new(recipe_params)
    @recipe.update(title: recipe_params[:title].downcase.titleize)
    @recipe.update(user_id: @user.id)
    @recipe.update(recipe_type: params[:recipe_type])
    if @recipe.save
      redirect_to new_ingredient_path
    else
      flash[:error] = @recipe.errors.full_messages
      render :new
    end
  end

  private

  def search_params
    params.permit(:q)
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :recipe_type, :user_id)
  end
end
