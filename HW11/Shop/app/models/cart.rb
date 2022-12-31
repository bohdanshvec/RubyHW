class Cart < ApplicationRecord
  has_many :line_items, dependent: :nullify

  def add_product(product)
    line_items.create(product: product, quantity: 1, price: product.price)
    # byebug
  end

  def summ_price
    line_items.map(&:price).sum
    # byebug
  end
end
