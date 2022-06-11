class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.references :food, null: false, foreign_key: true
      t.string :recipe_name
      t.text :recipe_content
      t.string :recipe_image

      t.timestamps
    end
  end
end
