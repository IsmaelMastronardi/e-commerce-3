class LanguageCode < ActiveRecord
  has_many :product_details
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }, uniqueness: true
end