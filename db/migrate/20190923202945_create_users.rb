class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :password_digest
      t.string :email, unique: true
      t.integer :role, default: 0
      t.text :avatar
      t.text :about
      t.bigint :telephone, unique: true

      t.timestamps
    end
  end
end
