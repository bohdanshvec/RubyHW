class CartsController < ApplicationController
  before_action :authenticate_user!
  def show
    # byebug
    # @line_items = LineItem.where(cart_id: current_cart.where(user_id: current_user.id).ids.first)
    
  end
end
