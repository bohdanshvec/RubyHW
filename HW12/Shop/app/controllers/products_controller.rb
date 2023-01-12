# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show]

  def index
    # byebug
    @products = Product.all
    @products = @products.where(category_id: params[:format]) if params[:format]
    # @categories = Category.all
  end

  def show
    @category = Category.find(@product.category_id)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end
end
