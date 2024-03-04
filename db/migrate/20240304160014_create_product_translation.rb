class CreateProductTranslation < ActiveRecord::Migration[7.1]
  def change
    create_table :product_translations do |t|
      t.string :name, null: false
      t.string :descriptions, null: false
      t.string :specifications, null: false
      t.string :characteristics, null: false
      t.references :language_code, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
