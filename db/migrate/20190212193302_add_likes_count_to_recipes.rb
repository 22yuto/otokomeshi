class AddLikesCountToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :likes_count, :integer
  end
end
