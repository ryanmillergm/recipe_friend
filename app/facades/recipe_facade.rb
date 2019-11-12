class RecipeFacade
  attr_reader :recipes
  def initialize(recipes)
    @recipes = recipes
  end

  def get_recipe_ingredients(recipe_id, ingredient_id)
    RecipeIngredient.where(recipe_id: recipe_id).find_by(ingredient_id: ingredient_id)
  end

  def recipe_favorited?(recipe_id, user_id)
    Favorite.where(user_id: user_id).find_by(recipe_id: recipe_id)
  end

  def find_recipe(id)
    Recipe.find(id)
  end

  def get_rating(recipe_id)
    recipe = Recipe.find(recipe_id)
    average_rating = (recipe.comments.sum(:rating) / recipe.comments.count.to_f).round(2)
  end

end
