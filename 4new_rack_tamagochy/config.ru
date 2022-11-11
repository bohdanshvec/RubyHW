require 'rack'
require 'rack/server'
require './lib/heros'


use Rack::Reloader

run Heros