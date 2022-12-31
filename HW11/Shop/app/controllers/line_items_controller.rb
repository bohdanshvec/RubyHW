class LineItemsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    if LineItem.where(product_id: params[:product_id]).present?
      new_quantity = LineItem.where(product_id: params[:product_id]).first.quantity + 1
      LineItem.find_by(product_id: params[:product_id]).update(quantity: new_quantity)
      new_price = LineItem.where(product_id: params[:product_id]).first.price + product.price
      LineItem.find_by(product_id: params[:product_id]).update(price: new_price)
    else
      current_cart.add_product(product)
    end
    redirect_to cart_path, notis: "#{product.name} was successfully added to the cart."
  end
end
