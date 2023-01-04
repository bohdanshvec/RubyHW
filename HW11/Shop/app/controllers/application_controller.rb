class ApplicationController < ActionController::Base
  # before_action :authenticate_user!

  # def current_cart
  #   Cart.find(cookies[:cart_id])
  # rescue ActiveRecord::RecordNotFound
  #   cart = Cart.create(user_id: current_user.id)
  #   cookies[:cart_id] = cart.id
  #   cart
  # end
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


  def reset_cart
    # Cart.find(cookies[:cart_id]).destroy
    cookies[:cart_id] = nil
  end



  # TOLIKA CODE:

  # def current_cart
  #   @current_cart ||= Cart.find(cookies_cart_id)
  # rescue ActiveRecord::RecordNotFound
  #   @current_cart = Cart.create(user_id: current_user.id)
  #   cookies[current_user.id] = { cart_id: @current_cart.id }
  #   @current_cart
  # end

  # def cookies_cart_id
  #   if cookies[current_user.id].present? 
  #       cookies[current_user.id][:cart_id]
  #   end
  # end

  # def reset_cart
  #   Cart.find(cookies_cart_id).destroy
  #   cookies[current_user.id] = nil
  # end

  helper_method :current_cart
  helper_method :reset_cart
end