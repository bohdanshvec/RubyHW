class LuckyUsersWorker
  include Sidekiq::Worker

  def perform
    p "Text in job, product----------------------"
  end
end