class RemoveOrderNumFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :order_num, :integer
  end
end
