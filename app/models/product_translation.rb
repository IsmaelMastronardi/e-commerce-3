class ProductTranslation < ApplicationRecord
  belongs_to :product
  
  validates :language, presence: true, length: { minimum: 2, maximum: 20 }
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :short_description, presence: true, length: { minimum: 10, maximum: 100 }
  validates :specifications, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :characteristics, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :color, presence: true, length: { minimum: 2, maximum: 100 }
  validates :product, presence: true
  validates_uniqueness_of :language, scope: :product_id
end
