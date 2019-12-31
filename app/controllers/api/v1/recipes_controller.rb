class Api::V1::RecipesController < Api::V1::ApiBaseController

  def index
    render json: RecipeSerializer.new(Recipe.all)
  end

  def show
    render json: RecipeSerializer.new(Recipe.where(title: params[:id].downcase.capitalize))
  end

end
