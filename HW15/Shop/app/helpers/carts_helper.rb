module CartsHelper
  def cart_counter
    current_cart.line_items.map(&:quantity).sum if current_cart.line_items.map(&:quantity).sum != 0
  end
end