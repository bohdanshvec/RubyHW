class OrderMailer < ApplicationMailer
  # include ActionView::AssetPaths
  include ActionView::Helpers::AssetTagHelper
  helper :application
  def order_create_email(order)
    @order = order
    attachments.inline['1.jpg'] = File.read("#{Rails.root}/app/assets/images/1.jpg")
    mail(to: @order.user.email, subject: 'Thank you for placing an order.')
    # attachments.inline(@order.cart.line_items.each { |line_item| image_tag((line_item.product.photo.attached? ? line_item.product.photo.variant(:thumb) : 'plug.png'), alt: line_item.product.name) })
  end
end
