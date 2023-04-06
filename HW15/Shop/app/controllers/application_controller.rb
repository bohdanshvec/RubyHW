# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_cart
  before_action :category_all

  def category_all
    @categories = Category.all
  end
  
  def current_cart
    if Cart.find(cookies[:cart_id]).user_id == current_user.id
      Cart.find(cookies[:cart_id])
    elsif Cart.where(user_id: current_user.id).present?
      Cart.where(user_id: current_user.id)
    else
      cart = Cart.create(user_id: current_user.id)
      cookies[:cart_id] = cart.id
      cart
    end
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create(user_id: current_user.id)
    cookies[:cart_id] = cart.id
    cart
  end
end
