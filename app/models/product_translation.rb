class ProductTranslation < ApplicationRecord
  belongs_to :product
  belongs_to :language_code

  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :short_description, presence: true, length: { minimum: 10, maximum: 100 }
  validates :specifications, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :characteristics, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :color, presence: true, length: { minimum: 2, maximum: 100 }
  validates :product, presence: true
  validates :language, presence: true
end