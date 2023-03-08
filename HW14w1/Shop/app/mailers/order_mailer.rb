class OrderMailer < ApplicationMailer
  
  def order_create_email(order, subject_text)
    @order = order
    mail(to: User.find(@order.user_id).email, subject: subject_text)
  end
end
