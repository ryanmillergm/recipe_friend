class RecipesController < ApplicationController
  def index
    binding.pry
    @recipes = Recipe.all
  end

  private

  def search_params
    params.permit(:q)
  end
end
