class RemoveOrderBodyFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :order_body, :text
  end
end
