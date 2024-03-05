class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.float :price, precision: 10, scale: 2, null: false, default: 0.0
      t.integer :available_amount, null: false, default: 0
      t.string :image, null: false
      t.references :category, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
