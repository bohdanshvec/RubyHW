# frozen_string_literal: true

require 'rack'
# require 'rack/server'
require './heros'

use Rack::Reloader
run Heros.new
