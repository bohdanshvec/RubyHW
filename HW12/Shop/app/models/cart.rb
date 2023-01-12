# frozen_string_literal: true

# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_carts_on_user_id  (user_id)
#
class Cart < ApplicationRecord
  has_many :line_items, dependent: :nullify
  has_one :order
  belongs_to :user

  def add_product(product)
    line_items.create(product:, quantity: 1, price: product.price)
  end

  def summ_price
    line_items.map(&:price).sum
  end
end
