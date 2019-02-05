class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.integer :category_id
      t.string :title
      t.text :body
      t.string :image_id
      t.string :time
      t.string :cost
      t.string :material
      t.string :quantity
      t.string :order_image
      t.integer :order_num
      t.text :order_body

      t.timestamps
    end
  end
end
