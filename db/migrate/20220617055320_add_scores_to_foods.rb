class AddScoresToFoods < ActiveRecord::Migration[6.0]
  def change
    add_column :foods, :scores, :float, default: 0
  end
end
