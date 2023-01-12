# frozen_string_literal: true

class LineItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :quantity_chenge, only: %i[quantity_plus quantity_reduce]

  def create
    # byebug
    product = Product.find(params[:product_id])
    adding_product_to_cart(product)
    # LineItem.where(cart_id: current_cart.where(user_id: current_user.id).ids.first)

    redirect_to cart_path, notis: "#{product.name} was successfully added to the cart."
  end

  def quantity_plus
    @line_item.quantity += 1
    @line_item.price += @product_price
    @line_item.save
    redirect_to cart_path, notis: 'Product added'
  end

  def quantity_reduce
    if @line_item.quantity == 1
      @line_item.destroy
    else
      @line_item.quantity -= 1
      @line_item.price -= @product_price
      @line_item.save
    end
    redirect_to cart_path, notis: 'Product added'
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path, notis: 'Product delete'
  end

  private

  def adding_product_to_cart(product)
    @line_item_to_cart = LineItem.where(cart_id: current_cart.id)
    if @line_item_to_cart.where(product_id: params[:product_id]).present?
      new_quantity = @line_item_to_cart.find_by(product_id: params[:product_id]).quantity + 1
      @line_item_to_cart.find_by(product_id: params[:product_id]).update(quantity: new_quantity)
      new_price = @line_item_to_cart.find_by(product_id: params[:product_id]).price + product.price
      @line_item_to_cart.find_by(product_id: params[:product_id]).update(price: new_price)
    else
      current_cart.add_product(product)
    end
  end

  def quantity_chenge
    @line_item = LineItem.find(params[:id])
    @product_price = Product.find(@line_item.product_id).price
  end
end
