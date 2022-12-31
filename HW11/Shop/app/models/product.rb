class Product < ApplicationRecord
  belongs_to :category
  has_many :line_items, dependent: :nullify

  def add_product(product)
    line_items(product: product)
  end
end
