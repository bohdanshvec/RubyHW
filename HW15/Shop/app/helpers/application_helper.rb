# frozen_string_literal: true

module ApplicationHelper

  def photo_display(line_item)
    image_tag((line_item.product.photo.attached? ? line_item.product.photo.variant(:thumb) : 'plug.jpg'), alt: line_item.product.name)
  end

  def cart_counter
    current_cart.line_items.map(&:quantity).sum if current_cart.line_items.map(&:quantity).sum != 0
  end

  def counter_product(product)
    current_cart.line_items.find_by(product_id: product.id).quantity
  end
  
end
