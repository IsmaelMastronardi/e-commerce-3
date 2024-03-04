class CreateJoinTableOrderProducts < ActiveRecord::Migration[7.1]
  def change
    create_join_table :products, :orders do |t|
      t.integer :quantity, null: false, default: 1

      t.index [:product_id, :order_id]
      t.index [:order_id, :product_id]
    end
  end
end
