class RecipeIngredientsController < ApplicationController

  def destroy
    @recipe_ingredient = RecipeIngredient.find(params[:id])
    @recipe = Recipe.find(params[:format])
    @recipe_ingredient.destroy
    @ingredient = @recipe.ingredients.first
    if recipe.ingredients.empty?
      flash[:success] = "Your ingredient has been removed"
      redirect_to edit_ingredient_path(@recipe.id)
    else
      flash[:success] = "Your ingredient has been removed"
      redirect_to edit_ingredient_path(@ingredient.id, @recipe.id)
    end
  end
end
