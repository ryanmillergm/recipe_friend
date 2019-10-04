class RecipeFacade
  attr_reader :recipes
  def initialize(recipes)
    @recipes = recipes
  end

  def get_recipe_ingredients(recipe_id, ingredient_id)
    RecipeIngredient.where(recipe_id: recipe_id).find_by(ingredient_id: ingredient_id)
  end

end