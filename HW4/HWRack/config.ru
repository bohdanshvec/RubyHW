# frozen_string_literal: true

require 'rack'
require './heros'

use Rack::Reloader # Мидлвар позволяющий править код без перезагрузки сервера
use Rack::Auth::Basic do |username, password| # Авторизация
  username == 'dan' && password == '6147' # Необходимо ввести во влплывающем окне при входе
end

run Heros.new # Запуск игры
