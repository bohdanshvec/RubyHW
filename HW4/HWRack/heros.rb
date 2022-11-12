# frozen_string_literal: true
require 'erb'
require 'byebug'
require './modules/html_forms'
require './modules/requests'
require './modules/html_pages'
require './modules/options'

# Основной класс игры
class Heros
  include HtmlForms
  include Requests
  include HtmlPages
  include Options

  def initialize
    @name = nil # name
    @race = nil # race
    @level = 0 # elementary level
    @satiety = 10 # full satiety
    @life = 2 # maximum life
    @health = 100 # full health
    @time_in_game = Time.new # time start game
  end

  # Основной метод вызова страниц
  def call(env)
    @req = Rack::Request.new(env)

    case
    when @req.post? 
      handle_post_requests
    when @req.get?
      return [200, {}, [forma_html]] if @name.nil?
      handle_get_requests
    else
      handle_default_requests
    end
  end
end
