# frozen_string_literal: true

require 'byebug'
require './battle'
require './modules/html_forms'
require './modules/requests'
require './modules/html_battle'
require './modules/html_pages'
require './modules/options'
# require 'json'

class MyApp
  include HtmlForms
  include Requests
  include HtmlBattle
  include HtmlPages
  include Options

  def initialize
    @name = nil
    @race = 'Elf'
    @level = 0 # elementary level
    @satiety = 8 # full satiety
    @life = 2 # maximum life
    @health = 100 # full health
    @time_in_game = Time.new # time start game
  end

  def call(env)
    @req = Rack::Request.new(env)

    # read cookie from req and validate it, if valid go to next steps, else not valid redirect to auth path

    handle_auth_request

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

  # Метод выводящий характеристики героя.
  def characteristics
    "#{@name}, #{@race}, #{@level} уровень, у Вас #{@life} жизни, #{@health} здоровья и #{@satiety} сытости."
  end



  private


end

  # class MyRackMiddleware
  #   def initialize(appl)
  #     @appl = appl
  #   end
  #   def call(env)
  #     status, headers, body = @appl.call(env)
  #     append_s = "... greetings from RubyLearning!!"
  #     [status, headers, body << append_s]
  #   end
  # end