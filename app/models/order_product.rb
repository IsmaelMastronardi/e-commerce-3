class OrderProduct < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :product, presence: true
  validates :order, presence: true

  def total
    quantity * price
  end
end