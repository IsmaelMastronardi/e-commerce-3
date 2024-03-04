class CreateLanguageCodes < ActiveRecord::Migration[7.1]
  def change
    create_table :language_codes do |t|

      t.timestamps
    end
  end
end
