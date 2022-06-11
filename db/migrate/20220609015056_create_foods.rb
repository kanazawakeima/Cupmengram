class CreateFoods < ActiveRecord::Migration[6.0]
  def change
    create_table :foods do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :image
      t.text :content
      t.string :company
      t.integer :price
      t.integer :taste
      t.integer :genre

      t.timestamps
    end
  end
end
