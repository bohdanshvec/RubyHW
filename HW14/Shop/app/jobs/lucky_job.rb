class LuckyJob < ApplicationJob
  queue_as :default

  def perform(*args)
    p "Text in job, product #{args}."
  end
end
