# frozen_string_literal: true

require 'rack'
require 'rack/server'
require './heros'
# require './myrackmyddleware'
use Rack::Reloader
# use MyRackMiddleware
run Heros
