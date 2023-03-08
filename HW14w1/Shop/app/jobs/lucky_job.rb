class LuckyJob < ApplicationJob
  queue_as :default

  def perform(args)
    p "---------------- Products - #{args}. -----------------"
  end
end
