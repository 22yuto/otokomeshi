class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :recipe_id
      t.string :order_image
      t.integer :order_num
      t.text :order_body

      t.timestamps
    end
  end
end
