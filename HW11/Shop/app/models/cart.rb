class Cart < ApplicationRecord
  has_many :line_items, dependent: :nullify
  has_one :order
  belongs_to :user

  def add_product(product)
    line_items.create(product: product, quantity: 1, price: product.price)
  end

  def summ_price
    line_items.map(&:price).sum
  end
end