class Api::V1::RecipesController < Api::V1::ApiBaseController

  def index
    render json: RecipeSerializer.new(Recipe.all)
  end

  def show
    render json: RecipeSerializer.new(Recipe.where("title LIKE ?", "%#{search_params[:id].downcase.titleize}%"))
  end

  private

  def search_params
    params.permit(:id)
  end

end
