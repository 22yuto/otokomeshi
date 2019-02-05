class RemoveOrderImageFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :order_image, :string
  end
end
