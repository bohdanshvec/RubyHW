require 'sidekiq-scheduler'

class LotteryMonthWorker
  include Sidekiq::Worker

  def perform
    LotteryMonthService.new.coll
  end
end