class ProductTranslation < ApplicationRecord
  belongs_to :product
  belongs_to :language_code
end
