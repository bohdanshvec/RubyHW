require 'rack'
require 'rack/server'
require './lib/greeter1'

use Rack::Reloader

run Greeter1#.new