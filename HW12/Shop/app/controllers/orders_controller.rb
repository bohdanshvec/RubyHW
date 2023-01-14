# frozen_string_literal: true

class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %i[update destroy]

  def index
    @orders = current_user.orders.all
  end

  def create
    @order = current_user.orders.create(cart: current_cart)
    # reset_cart
    # Cart.find(cookies[:cart_id]).destroy
    cookies[:cart_id] = nil
    redirect_to order_path(@order), notice: 'Order was successfuiiy created'
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def update
    @order.update(status: :paid)
    redirect_to orders_path, notice: 'Thank you for your payment, we will send the goods to you as quickly as possible.'
  end

  def destroy
    @order.destroy
    redirect_to orders_path, notice: 'Order delete'
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status)
  end
end
