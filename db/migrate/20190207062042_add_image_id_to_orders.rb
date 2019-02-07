class AddImageIdToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :image_id, :string
  end
end
