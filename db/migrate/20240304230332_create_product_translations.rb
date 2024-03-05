class CreateProductTranslations < ActiveRecord::Migration[7.1]
  def change
    create_table :product_translations do |t|
      t.string :description, null: false
      t.string :short_description, null: false
      t.string :specifications, null: false
      t.string :characteristics, null: false
      t.string :color, null: false
      t.references :product, null: false, foreign_key: true
      t.references :language_code, null: false, foreign_key: true

      t.timestamps
    end
  end
end
