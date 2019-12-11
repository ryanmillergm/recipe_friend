
@user1 = User.create(id: 1, first_name: "ryan", last_name: "miller", username: "user1", password: "password", email: "user1@gmail.com", role: 1, about: "Me", telephone: 5555555555, email_confirmed: true)
@user2 = User.create(id: 2, first_name: "user", last_name: "user", username: "user2", password: "password", email: "user2@gmail.com", role: 0, about: "Me", telephone: 5555555555, email_confirmed: true)
@user3 = User.create(id: 3, first_name: "user", last_name: "user", username: "user2", password: "password", email: "user2@gmail.com", role: 0, about: "Me", telephone: 5555555555, email_confirmed: true)

@ingredient1 = Ingredient.create(name: "basil", ingredient_type: 0)
@ingredient2 = Ingredient.create(name: "oregano", ingredient_type: 0)
@ingredient3 = Ingredient.create(name: "thyme", ingredient_type: 0)
@ingredient4 = Ingredient.create(name: "flour", ingredient_type: 3)
@ingredient5 = Ingredient.create(name: "wheat flour", ingredient_type: 3)
@ingredient6 = Ingredient.create(name: "tomato", ingredient_type: 1)
@ingredient7 = Ingredient.create(name: "carrots", ingredient_type: 5)
@ingredient8 = Ingredient.create(name: "celery", ingredient_type: 5)
@ingredient9 = Ingredient.create(name: "chicken", ingredient_type: 3)
@ingredient10 = Ingredient.create(name: "chicken broth", ingredient_type: 2)
@ingredient11 = Ingredient.create(name: "egg noodle", ingredient_type: 3)
@ingredient12 = Ingredient.create(name: "tomato sauce", ingredient_type: 2)
@ingredient13 = Ingredient.create(name: "spaghetti noodles", ingredient_type: 3)
@ingredient14 = Ingredient.create(name: "egg", ingredient_type: 3)
@ingredient15 = Ingredient.create(name: "beef chuck", ingredient_type: 3)
@ingredient16 = Ingredient.create(name: "potatoes", ingredient_type: 5)
@ingredient17 = Ingredient.create(name: "beef stock", ingredient_type: 2)

@recipe1 = Recipe.create(title: "Spaghetti", description: "This recipe is for Spaghetti", recipe_type: 2, user_id: @user1.id, image_coords: "1200x1200+0+0")
@recipe2 = Recipe.create(title: "Chicken Noodle Soup", description: "This recipe is for chicken noodle soup", recipe_type: 2, user_id: @user1.id, image_coords: "1666.6666666666667x1666.6666666666667+0+0")
@recipe3 = Recipe.create(title: "Fresh Lasagna pasta", description: "This recipe is for lasagna noodles", recipe_type: 3, user_id: @user1.id, image_coords:  "450x450+66+0")
@recipe4 = Recipe.create(title: "Pot Roast", description: "This recipe is for a delicious slow cooked beef potroast", recipe_type: 3, user_id: @user1.id, image_coords: "1500x1500+0+0")

@recipe1.image.attach(io: File.open('app/assets/images/Spaghetti-Meat-Sauce.jpg'), filename: 'Spaghetti-Meat-Sauce.jpg', content_type: "image/jpeg")
@recipe2.image.attach(io: File.open('app/assets/images/chicken-noodle-soup.jpg'), filename: 'chicken-noodle-soup.jpg', content_type: "image/jpeg")
@recipe3.image.attach(io: File.open('app/assets/images/homemade-pasta-lasagna-sheet.jpg'), filename: 'homemade-pasta-lasagna-sheet.jpg', content_type: "image/jpeg")
@recipe4.image.attach(io: File.open('app/assets/images/Pot-Roast.jpg'), filename: 'Pot-Roast.jpg', content_type: "image/jpeg")

@step1 = Step.create(step: "Add all ingredients together and mix", recipe_id: @recipe1.id)
@step2 = Step.create(step: "Add all ingredients together and mix", recipe_id: @recipe2.id)
@step3 = Step.create(step: "Add all ingredients together and mix", recipe_id: @recipe3.id)
@step4 = Step.create(step: "Add all ingredients together and mix", recipe_id: @recipe4.id)

@recipe_ingredient1 = RecipeIngredient.create(measurement_type: 1, measurement: 1, quantity: 2, ingredient_id: @ingredient1.id, recipe_id: @recipe1.id)
@recipe_ingredient2 = RecipeIngredient.create(measurement_type: 0, measurement: 0, quantity: 2, ingredient_id: @ingredient2.id, recipe_id: @recipe1.id)
@recipe_ingredient3 = RecipeIngredient.create(measurement_type: 1, measurement: 2, quantity: 2, ingredient_id: @ingredient3.id, recipe_id: @recipe1.id)
@recipe_ingredient4 = RecipeIngredient.create(measurement_type: 1, measurement: 3, quantity: 2, ingredient_id: @ingredient12.id, recipe_id: @recipe1.id)
@recipe_ingredient5 = RecipeIngredient.create(measurement_type: 2, measurement: 4, quantity: 2, ingredient_id: @ingredient13.id, recipe_id: @recipe1.id)

@recipe_ingredient6 = RecipeIngredient.create(measurement_type: 1, measurement: 2, quantity: 2, ingredient_id: @ingredient7.id, recipe_id: @recipe2.id)
@recipe_ingredient7 = RecipeIngredient.create(measurement_type: 0, measurement: 0, quantity: 2, ingredient_id: @ingredient8.id, recipe_id: @recipe2.id)
@recipe_ingredient8 = RecipeIngredient.create(measurement_type: 2, measurement: 1, quantity: 2, ingredient_id: @ingredient9.id, recipe_id: @recipe2.id)
@recipe_ingredient9 = RecipeIngredient.create(measurement_type: 2, measurement: 3, quantity: 2, ingredient_id: @ingredient11.id, recipe_id: @recipe2.id)

@recipe_ingredient10 = RecipeIngredient.create(measurement_type: 2, measurement: 4, quantity: 2, ingredient_id: @ingredient4.id, recipe_id: @recipe3.id)
@recipe_ingredient11 = RecipeIngredient.create(measurement_type: 2, measurement: 2, quantity: 2, ingredient_id: @ingredient14.id, recipe_id: @recipe3.id)

@recipe_ingredient12 = RecipeIngredient.create(measurement_type: 2, measurement: 2, quantity: 2, ingredient_id: @ingredient15.id, recipe_id: @recipe4.id)
@recipe_ingredient13 = RecipeIngredient.create(measurement_type: 1, measurement: 3, quantity: 3, ingredient_id: @ingredient16.id, recipe_id: @recipe4.id)
@recipe_ingredient13 = RecipeIngredient.create(measurement_type: 1, measurement: 2, quantity: 4, ingredient_id: @ingredient17.id, recipe_id: @recipe4.id)
