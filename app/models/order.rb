class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_items

  scope :current_order, -> { where(completed: true) }
  scope :past_orders, -> { where(completed: false) }
  
  def total
  end

  def complete!
    update(completed: true)
  end
end