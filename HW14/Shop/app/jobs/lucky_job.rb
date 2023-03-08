class LuckyJob < ApplicationJob
  queue_as :default

  # include Sidekiq::LuckyJob

  def perform(*args)
    puts "Text in job, product #{args}."
  end
end
