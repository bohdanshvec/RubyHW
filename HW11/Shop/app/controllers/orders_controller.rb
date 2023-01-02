class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @order = current_user.orders.create(cart: current_cart)
    # cookies.delete(:cart_id)
# byebug
    redirect_to order_path(@order), notice: 'Order was successfuiiy created'
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status: :paid)
byebug
    redirect_to root_path, notice: 'Thank you for your payment, we will send the goods to you as quickly as possible.'
  end

  private

  def order_params
    params.require(:order).permit(:status)
  end
end
