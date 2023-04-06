require 'sidekiq-scheduler'

class LotteryMonthWorker
  include Sidekiq::Worker

  def perform
    LotteryMonthService.new.call
  end
end