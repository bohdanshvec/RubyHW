# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all
    @products = @products.where(category_id: params[:format]) if params[:format]
  end

  def show
    @product = Product.find(params[:id])
    @category = Category.find(@product.category_id)
  end
end
