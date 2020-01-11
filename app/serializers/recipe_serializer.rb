class RecipeSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title,
             :description

end
