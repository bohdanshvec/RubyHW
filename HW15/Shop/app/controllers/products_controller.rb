# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.all.includes(photo_attachment: :blob)
    @products = @products.where(category_id: params[:query]) if params[:query]
  end

  def show
    @product = Product.find(params[:id])
    @category = Category.find(@product.category_id)
  end

  def new; end
end
