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
    else
      flash[:error] = @ingredient.errors.full_messages
      render :new
    end
  end

  def edit
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @ingredient = @recipe.ingredients.first
    @recipes_facade = RecipeFacade.new(@recipe)
  end

  def update
    @recipe = Recipe.find(params[:ingredient][:recipe_id])
    @ingredient = Ingredient.find(params[:id])
    @ingredient.update(ingredient_params)
    if @ingredient.save
      @ingredient.update(ingredient_type: params[:ingredient_type])
      update_recipe_ingredient(@recipe, @ingredient)
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
      flash[:message] = "Your ingredient has been added to #{@recipe.title}"
      redirect_to new_ingredient_path
    else
      flash[:error] = @recipe_ingredient.errors.full_messages
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

  def update_recipe_ingredient(recipe, ingredient)
    @recipe_ingredient = RecipeIngredient.find_by(recipe_id: recipe.id)
    @recipe_ingredient.update(
      measurement_type: params[:measurement_type],
      measurement: params[:measurement],
      quantity: params[:ingredient][:recipe_ingredient][:quantity],
      ingredient_id: ingredient.id,
      recipe_id: recipe.id
    )
    if @recipe_ingredient.save
      binding.pry
      flash[:message] = "#{ingredient.name.titleize} has been updated for #{@recipe.title}"
      redirect_to edit_ingredient_path(@recipe.id)
    else
      flash[:error] = @recipe_ingredient.errors.full_messages
      render :new
    end
  end
end
