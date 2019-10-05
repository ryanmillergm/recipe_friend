class IngredientsController < ApplicationController

  def new
    @recipe = Recipe.last
    @ingredient = Ingredient.new
  end

  def create
    @recipe = Recipe.last
    @ingredient = Ingredient.find_or_create_by(ingredient_params)
    if @ingredient.save
      @ingredient.update(ingredient_type: params[:ingredient_type])
      create_recipe_ingredient(@recipe, @ingredient)
      flash[:message] = "Your ingredient has been added to #{@recipe.title}"
      redirect_to new_ingredient_path
    else
      flash[:error] = @ingredient.errors.full_messages
      render :new
    end
  end

  private

  def ingredient_params
    ingredients = {
      name: params[:ingredient][:name],
      ingredient_type: params[:ingredient_type]
    }
  end

  def create_recipe_ingredient(recipe, ingredient)
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredients_params(recipe, ingredient))
    if @recipe_ingredient.save
      @recipe_ingredient
    else
      flash[:error] = @recipe.errors.full_messages
      render :new
    end
  end

  def recipe_ingredients_params(recipe, ingredient)
    ri_params = {
      measurement_type: params[:measurement_type],
      measurement: params[:measurement],
      quantity: params[:ingredient][:recipe_ingredients][:quantity],
      ingredient_id: ingredient.id,
      recipe_id: recipe.id
    }
  end
end
