class LineItemsController < ApplicationController
  def create
    byebug
    product = Product.find(params[:product_id])
    current_cart.add_product(product)

    redirect_to cart_path, notis: "#{product.name} was successfully added to the cart."
  end
end
