class LotteryMonthMailer < ApplicationMailer
  def lottery_month_create_email(user_email)
    @user_email = user_email
    mail(to: @user_email, subject: "You have become a lottery winner.")
  end
end