class RecipesController < ApplicationController
  before_action :set_user, only: [:show, :new, :create, :edit, :update, :destroy]

  def index
    @query = search_params[:q]
    @recipes = Recipe.get_recipes(search_params)
    @recipes_facade = RecipeFacade.new(@recipes)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipes_facade = RecipeFacade.new(@recipes)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.update(title: recipe_params[:title].downcase.titleize)
    @recipe.update(user_id: @user.id)
    @recipe.update(recipe_type: params[:recipe_type])
    if @recipe.save
      redirect_to new_ingredient_path(@recipe.id)
    else
      flash[:error] = @recipe.errors.full_messages
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @ingredient = @recipe.ingredients.first
    if @ingredient.nil?
      redirect_to edit_ingredient_path(@recipe.id)
    elsif
      @recipe.update(recipe_params)
      redirect_to edit_ingredient_path(@ingredient.id, @recipe.id)
    else
      flash[:error] = @recipe.errors.full_messages
      redirect_to edit_user_recipe_path(@recipe.id)
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe_title = recipe.title
    if current_user && current_user.id == recipe.user_id
      Favorite.where(recipe_id: recipe.id).destroy_all
      Step.where(recipe_id: recipe.id).destroy_all
      recipe.destroy
      flash[:message] = "You have successfully deleted #{recipe_title}"
      redirect_to dashboard_my_recipes_path
    else
      flash[:error] = "You do not have permission to perform this action. Your id now has a strike and you have been reported for attempting to attack this site."
    end
  end

  private

  def set_user
    @user = current_user
  end

  def search_params
    params.permit(:q)
  end

  def recipe_params
    params.require(:recipe).permit(:title, :description, :recipe_type, :user_id, :image)
  end
end
