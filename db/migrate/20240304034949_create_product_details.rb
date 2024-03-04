class CreateProductDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :product_details do |t|
      t.string :description, null: false
      t.string :short_description, null: false
      t.string :specifications, null: false
      t.string :characteristics, null: false
      t.string :color, null: false

      t.timestamps
    end
  end
end
