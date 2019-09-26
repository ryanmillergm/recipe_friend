class RecipesController < ApplicationController
  def index
    @recipe_results = Recipe.where("title LIKE ?", "%#{search_params[:q]}%")
  end

  private

  def search_params
    params.permit(:q)
  end
end
