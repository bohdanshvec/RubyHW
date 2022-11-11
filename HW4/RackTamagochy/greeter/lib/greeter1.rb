require 'erb'
require 'byebug'

class Greeter1

  def self.call(env)
    new(env).response.finish
  end

  def initialize(env)
    @request = Rack::Request.new(env)
  end

  def response
    case @request.path
    when '/'
      Rack::Response.new(render("index.html.erb"))
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

  def show_name
    @request.cookies["name"] || "11111"
  end
end