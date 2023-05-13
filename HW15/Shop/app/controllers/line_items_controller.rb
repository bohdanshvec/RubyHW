# frozen_string_literal: true

class LineItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :quantity_chenge, only: %i[quantity_plus quantity_reduce]

  def create
    @product = Product.find(params[:product_id])
    adding_product_to_cart(@product)

    respond_to do |format|
      format.html
      format.turbo_stream
    end

    # respond_to do |format|
    #   format.html { redirect_to products_path, notice: "#{@product.name} was successfully added to the cart." }
    #   format.turbo_stream
    # end

    # respond_to do |format|
    #   format.html { redirect_to products_path, notice: "#{@product.name} was successfully added to the cart." }
    #   format.turbo_stream
    # end

    # flash[:notice] = "#{product.name} was successfully added to the cart."
    # respond_to do |format|
    #   format.html { redirect_to line_item_path(id: @line_item.id) }
    #   # format.turbo_stream
    # end
    # redirect_back fallback_location: root_path, notice: "#{@product.name} was successfully added to the cart."
    # respond_to do |format|
    #   format.html do
    #     flash[:notice] = "#{product.name} was successfully added to the cart."
    #   end
    # end
    # redirect_to products_path, notice: "#{@product.name} was successfully added to the cart."
    # flash[:notice] = "#{@product.name} was successfully added to the cart."
    # redirect_back fallback_location: root_path
  end

  def quantity_plus
    @line_item.quantity += 1
    @line_item.price += @product_price
    @line_item.save
    redirect_to cart_path, notice: "Product #{@line_item.product.name} added"
    # respond_to do |format|
    #   format.html
    #   format.turbo_stream
    # end
  end

  def quantity_reduce
    if @line_item.quantity == 1
      @line_item.destroy
    else
      @line_item.quantity -= 1
      @line_item.price -= @product_price
      @line_item.save
    end
    redirect_to cart_path, notice: "Product #{@line_item.product.name} delete"
    # respond_to do |format|
    #   format.html
    #   format.turbo_stream
    # end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path, notice: "Product #{@line_item.product.name} delete"
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
