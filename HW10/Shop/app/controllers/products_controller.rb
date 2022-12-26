class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    @products = Product.all
  end

  def show
    @category = Category.find(@product.category_id)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
