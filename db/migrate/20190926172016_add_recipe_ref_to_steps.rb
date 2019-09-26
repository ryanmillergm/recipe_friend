class AddRecipeRefToSteps < ActiveRecord::Migration[5.2]
  def change
    add_reference :steps, :recipe, foreign_key: true
  end
end
