class ApplicationController < ActionController::API
  include Pagy::Backend
  # Pagy::DEFAULT[:items] = 15 # rescheduled in pagy.rb

end
