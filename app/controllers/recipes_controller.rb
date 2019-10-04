class RecipesController < ApplicationController
  def index
    @recipes = Recipe.get_recipe_results(search_params)
    @recipes_facade = RecipeFacade.new(@recipes)
    # @recipe_results = Recipe.get_recipe_results(search_params)
  end

  def new
    @recipe = Recipe.new
  end

  private

  def search_params
    params.permit(:q)
  end
end
