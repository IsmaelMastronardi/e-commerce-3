class Product < ApplicationRecord
  belongs_to :brand
  belongs_to :category
  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :available_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :image, presence: true
end