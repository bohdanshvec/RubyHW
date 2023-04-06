class LotteryMonthJob < ApplicationJob
  queue_as :default

  def perform(product)
    @product = product
    LotteryMonthMailer.lottery_month_create_email(@product).deliver_later
  end
end
