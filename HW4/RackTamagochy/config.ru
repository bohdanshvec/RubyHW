# frozen_string_literal: true

require 'rack'
require 'rack/server'
require './my_app'
# require './myrackmyddleware'
use Rack::Reloader
# use MyRackMiddleware
run MyApp.new
