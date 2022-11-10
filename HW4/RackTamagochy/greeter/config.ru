require 'rack'
require 'rack/server'
require './lib/greeter'

use Rack::Reloader

run Greeter.new