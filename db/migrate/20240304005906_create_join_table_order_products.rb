class CreateOrderProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :order_products, do |t|
      t.integer :quantity, null: false, default: 1

      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
    end
  end
end
