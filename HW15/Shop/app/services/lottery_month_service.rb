class LotteryMonthService

  def call
    lottery
  end

  private
    def set_users
      orders_per_month = Order.select { |month| month.created_at.month == Time.now.month }
      orders_paid = orders_per_month.select { |order| order.paid? }
      two_users = orders_paid.map(&:user).uniq.sample(2)
    end

    def lottery
      set_users.each { |user| LotteryMonthMailer.lottery_month_create_email(user.email).deliver_later } 
    end
end