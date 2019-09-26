class CreateRecipe < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.integer :type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
