# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user1 = User.create(first_name: "ryan", last_name: "miller", username: "user1", password: "password", email: "user1@gmail.com", role: 1, avatar: "avatar", about: "Me", telephone: 5555555555)
@user2 = User.create(first_name: "user", last_name: "user", username: "user2", password: "password", email: "user2@gmail.com", role: 0, avatar: "avatar", about: "Me", telephone: 5555555555) 

@ingredient1 = Ingredient.create(name: "basil", ingredient_type: 1)
@ingredient2 = Ingredient.create(name: "oregano", ingredient_type: 1)
@ingredient3 = Ingredient.create(name: "thyme", ingredient_type: 1)
@ingredient4 = Ingredient.create(name: "flour", ingredient_type: 2)
@ingredient5 = Ingredient.create(name: "wheat flour", ingredient_type: 2)
@ingredient6 = Ingredient.create(name: "tomato", ingredient_type: 3)
@ingredient7 = Ingredient.create(name: "carrots", ingredient_type: 4)
@ingredient8 = Ingredient.create(name: "celery", ingredient_type: 4)
@ingredient9 = Ingredient.create(name: "chicken", ingredient_type: 5)
@ingredient10 = Ingredient.create(name: "chicken broth", ingredient_type: 6)
@ingredient11 = Ingredient.create(name: "egg noodle", ingredient_type: 7)
@ingredient12 = Ingredient.create(name: "tomato sauce", ingredient_type: 8)
@ingredient13 = Ingredient.create(name: "spaghetti noodles", ingredient_type: 9)
@ingredient14 = Ingredient.create(name: "egg", ingredient_type: 10)

@recipe1 = Recipe.create(title: "Spaghetti", description: "This recipe is for Spaghetti", recipe_type: 2, user_id: @user1.id)
@recipe2 = Recipe.create(title: "Chicken Noodle Soup", description: "This recipe is for chicken noodle soup", recipe_type: 2, user_id: @user1.id)
@recipe3 = Recipe.create(title: "Fresh Lasagna pasta", description: "This recipe is for lasagna noodles", recipe_type: 3, user_id: @user1.id)

@step1 = Step.create(step: "Add all ingredients together and mix", recipe_id: @recipe1.id)
@step2 = Step.create(step: "Add all ingredients together and mix", recipe_id: @recipe2.id)
@step3 = Step.create(step: "Add all ingredients together and mix", recipe_id: @recipe3.id)

@recipe_ingredient1 = RecipeIngredient.create(measurement_type: 1, measurement: 2, quantity: 2, ingredient_id: @ingredient1.id, recipe_id: @recipe1.id)
@recipe_ingredient2 = RecipeIngredient.create(measurement_type: 1, measurement: 2, quantity: 2, ingredient_id: @ingredient2.id, recipe_id: @recipe1.id)
@recipe_ingredient3 = RecipeIngredient.create(measurement_type: 1, measurement: 2, quantity: 2, ingredient_id: @ingredient3.id, recipe_id: @recipe1.id)
@recipe_ingredient4 = RecipeIngredient.create(measurement_type: 1, measurement: 2, quantity: 2, ingredient_id: @ingredient12.id, recipe_id: @recipe1.id)
@recipe_ingredient5 = RecipeIngredient.create(measurement_type: 2, measurement: 2, quantity: 2, ingredient_id: @ingredient13.id, recipe_id: @recipe1.id)

@recipe_ingredient6 = RecipeIngredient.create(measurement_type: 1, measurement: 2, quantity: 2, ingredient_id: @ingredient7.id, recipe_id: @recipe2.id)
@recipe_ingredient7 = RecipeIngredient.create(measurement_type: 1, measurement: 2, quantity: 2, ingredient_id: @ingredient8.id, recipe_id: @recipe2.id)
@recipe_ingredient8 = RecipeIngredient.create(measurement_type: 2, measurement: 2, quantity: 2, ingredient_id: @ingredient9.id, recipe_id: @recipe2.id)
@recipe_ingredient9 = RecipeIngredient.create(measurement_type: 2, measurement: 2, quantity: 2, ingredient_id: @ingredient11.id, recipe_id: @recipe2.id)

@recipe_ingredient10 = RecipeIngredient.create(measurement_type: 2, measurement: 2, quantity: 2, ingredient_id: @ingredient4.id, recipe_id: @recipe3.id)
@recipe_ingredient10 = RecipeIngredient.create(measurement_type: 2, measurement: 2, quantity: 2, ingredient_id: @ingredient14.id, recipe_id: @recipe3.id)
