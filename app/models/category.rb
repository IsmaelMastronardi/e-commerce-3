class Category < ApplicationRecord
  has_many :products
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }, uniqueness: true
end
