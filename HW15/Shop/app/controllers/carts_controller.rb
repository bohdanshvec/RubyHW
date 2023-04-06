# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :authenticate_user!
end
