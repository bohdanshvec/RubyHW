require './app/pet1'
require 'rack'

use Rack::Reloader
use Rack::Static, :urls => ["/public"]
use Rack::Auth::Basic do |username, password|
  username == 'admin'
  password == 'qwerty'
end
run Pet