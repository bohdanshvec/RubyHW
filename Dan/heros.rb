# frozen_string_literal: true
require 'erb'
require 'byebug'
require './modules/html_forms'
require './modules/requests'
require './modules/html_pages'
require './modules/options'

class Heros
  include HtmlForms
  include Requests
  include HtmlPages
  include Options

  # def self.call(env)
  #   new(env).response.finish
  # end

  def initialize#(env)
    @name = "Dan"
    @race = 'Elf'
    @level = 0 # elementary level
    @satiety = 10 # full satiety
    @life = 2 # maximum life
    @health = 100 # full health
    @time_in_game = Time.new # time start game
  end

  def call(env)#response
    @request = Rack::Request.new(env).finish

    case @request.path
    when '/'
      Rack::Response.new(render("menu.html.erb")).finish
    when "/change"
      @name = @request.params[("name")]
      Rack::Response.new do |response|
        response.set_cookie("name", @request.params[("name")])
        response.redirect("/")
      end
    else response("Not Found", 404)
    end
  end

  def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end

#   def call(env)
#     @req = Rack::Request.new(env)

#     # read cookie from req and validate it, if valid go to next steps, else not valid redirect to auth path

#     handle_auth_request

#     case
#     when @req.post? 
#       handle_post_requests
#     when @req.get?
#       return [200, {}, [forma_html]] if @name.nil?
 
#       handle_get_requests
#     else
#       handle_default_requests
#     end
#   end

#   # Метод выводящий характеристики героя.
#   def characteristics
#     "#{@name}, #{@race}, #{@level} уровень, у Вас #{@life} жизни, #{@health} здоровья и #{@satiety} сытости."
#   end

# end

#   # class MyRackMiddleware
#   #   def initialize(appl)
#   #     @appl = appl
#   #   end
#   #   def call(env)
#   #     status, headers, body = @appl.call(env)
#   #     append_s = "... Вы проголодались, подкрепитесь !!!"
#   #     [status, headers, body << append_s]
#   #   end
#   # end