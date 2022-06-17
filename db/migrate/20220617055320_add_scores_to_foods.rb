class AddScoresToFoods < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :scores, :float
  end
end
