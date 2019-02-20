class AddOpenFlgToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :open_flg, :boolean, default: false, null: false
  end
end
