class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products
  has_one :product_detail, dependent: :destroy
  accepts_nested_attributes_for :product_detail
  has_many :product_translations, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :available_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :image, presence: true
  validates :category, presence: true
  validates :brand, presence: true
end
