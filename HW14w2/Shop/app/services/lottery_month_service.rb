class LotteryMonthService

  def coll
    set_orders.each { |order| LotteryMonthMailer.lottery_month_create_email(order.user.email).deliver_later } 
  end

  private
    def set_orders
      orders = Order.all
      orders.select { |month| month.created_at.month == Time.now.month }.sample(2)
    end
end