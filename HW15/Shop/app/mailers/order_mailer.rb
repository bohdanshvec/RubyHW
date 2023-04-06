class OrderMailer < ApplicationMailer
  helper :application

  def order_create_email(order)
    @order = order
    @order.cart.line_items.each do |line_item|
      if line_item.product.photo.attached?
        file_name = line_item.product.photo.filename.to_s 
        attachments[file_name] = File.read("#{Rails.root}/app/assets/images/#{file_name}")
      end
    end
    mail(to: @order.user.email, subject: 'Thank you for placing an order.')
  end
end
