class RecipesController < ApplicationController
  def index
    @recipe_results = Recipe.get_recipe_results(search_params)
  end

  private

  def search_params
    params.permit(:q)
  end
end
