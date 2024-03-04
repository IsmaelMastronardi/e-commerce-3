class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.boolean :completed, null: false, default: false
      t.float :total_price, precision: 7, scale: 2, null: false, default: 0.0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
