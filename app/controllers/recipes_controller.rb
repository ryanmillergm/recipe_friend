class RecipesController < ApplicationController
  def index
    binding.pry
    @recipes = Recipe.where(name: search_params[:q])
  end

  private

  def search_params
    params.permit(:q)
  end
end
