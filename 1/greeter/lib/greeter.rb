require 'erb'
require 'byebug'

class Greeter

  def call(env)
    @request = Rack::Request.new(env)
    
    case @request.path
    when "/"
      response(render("index.html.erb"))
      
    when "/change"
      Rack::Response.new.finish do |response|
        response.set_cookie("cname", @request.params[("name")])
        response.redirect("/")
      end
    else response("Not Found", 404)
    end
  end

  def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end

  def response(arg)
    Rack::Response.new(arg).finish
  end
end