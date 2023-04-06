# frozen_string_literal: true

module ApplicationHelper

  def photo_display(line_item)
    image_tag((line_item.product.photo.attached? ? line_item.product.photo.variant(:thumb) : 'plug.jpg'), alt: line_item.product.name)
  end
end
