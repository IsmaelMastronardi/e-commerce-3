class CreateLanguageCodes < ActiveRecord::Migration[7.1]
  def change
    create_table :language_codes do |t|
      t.string :language, null: false
      t.string :iso, null: false

      t.timestamps
    end
  end
end
