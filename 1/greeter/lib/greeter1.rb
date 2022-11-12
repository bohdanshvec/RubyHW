require 'erb'
require 'byebug'

class Greeter1

  def self.call(env)
    new(env).response.finish
  end

  def initialize(env)
    @request = Rack::Request.new(env)
    @name = @request.cookies['name'] 
    @race = @request.cookies['race']
    @level = @request.cookies['level'] || 0 # elementary level
    @satiety = @request.cookies['satiety'] || 10 # full satiety
    @life = @request.cookies['life'] || 2 # maximum life
    @health = @request.cookies['health'] || 100 # full health
    @time = @request.cookies['time'] || Time.new # time start game
    # byebug
  end

  def response
    case @request.path
    when '/'
      # byebug
      tmpl = ['name', 'race'].none? { |x| @request.cookies[x] } ? 'form' : 'menu' 
      Rack::Response.new(render(tmpl + '.html.erb'))
      # @name.nil? || @race.nil? ? Rack::Response.new(render("form.html.erb")) : Rack::Response.new(render("menu.html.erb"))
    when "/change"
      # byebug
      # @name = @request.params[("name")]
      # @race = @request.params[("race")]
      # @request.redirect("/")
      
      Rack::Response.new do |response|
        response.set_cookie('health', @health)
        response.set_cookie('name', @request.params['name'])
        response.set_cookie('race', @request.params['race'])
        response.set_cookie('level', @level)
        response.set_cookie('satiety', @satiety)
        response.set_cookie('life', @life)
        response.set_cookie('time', @time)
        # byebug
        response.redirect("menu")
        byebug
      end
    when '/8'
      Rack::Response.new(render("form.html.erb"))
    when '/menu'
      Rack::Response.new(render("menu.html.erb"))
    else Rack::Response.new(render("error.html.erb"))
    end
  end

  def render(template)
    path = File.expand_path("../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end

  def get(arg)
    @request.cookies[arg]
  end

  def menu
    "<h3>Выбирайте, что будете делать:<br/>
    1. Сражусь с драконом.<br/>
    2. Попытаюсь взломать сейф.<br/>
    3. Посплю, оно и немного силы восстановит.<br/>
    4. Схожу в тренажерный зал.<br/>
    5. Пойду поем.<br/>
    6. Посмотреть общее время нахождения в игре.<br/>
    7. Правила игры.<br/>
    8. Изменить ИМЯ Вашего героя.<br/>
    <br/>
    9. - выход из игры</h3>"
  end

  def battle_links
    "<a href='/'>1</a>
    <a href='/battle?step=2'>2</a>
    <a href='/battle?step=3'>3</a>
    <a href='/'>menu</a>"
  end

  def battle_with_dragon
    "<h3>Вы в логове дракона.<br/>
    И как всгда у Вас есть выбор:<br/>
    <br/>
    1. Уйду восвояси, бои не по мне.<br/>
    2. Сражусь с ДРАКОНОМ, в АТАКУ !!!<br/>
    3. Правила игры</h3>"
  end

  def do_sport_page
    "Раз - Два - Три - Четыре - Пять - начитаню здоровье поднимать."
  end

  def do_sleep_page
    "Тише - Тише, я сплю, здоровье моё растёт."
  end

  def regulations_game
    "<h3>В этой игре Вы герой у вас есть ограниченных 2 жизни, по 100 здоровья в каждой и ограниченная сытость(10).</br>
    В начале игры Вы 0-ого уровня, но с каждыми активными действиями Ваш уровень будет расти.</br>
    Вы можете терять здоровье, но всегда и можете его пополнить.</br>
    Будете постепенно (выполняя действия) терять сытость, но всегда сможете поесть.</br>
    </br>
      Приятной ИГРЫ."
  end

  def menu_link
    "<a href='/'>menu</a>"
  end

  def go_eat_page
    "<h3>Ам - Ам - Чявк, я кушаю.<br/>
    Вы полностью сыты.<h3/>"
  end
  
  def total_time
    t = Time.now - @time_in_game
    if t < 60
      "Вы в игре всего лишь #{t.to_i} секунд."
    elsif t.to_i.between?(60, 3600)
      "Вы в игре #{t.to_i / 60} минут и #{t.to_i % 60} секунд."
    end
  end

  def exit_gem
    system('exit')
  end

  def game_end
    '<!doctype html>
    <html lang="en">
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
      </head>
      <body>
        <h1>Hello, world!</h1>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
      </body>
    </html>'
  end

  def template_start(data, links = template_links)
    "
      <!DOCTYPE html>
      <html lang=\"en\">
        <head>
          <meta charset=\"utf-8\">
          <title>Heros</title>
        </head>
        <body>
        <h1>#{characteristics}</h1>
        <h2>#{data}</h2>
        <h2>#{"Вы проголодались, подкрепитесь !!!" if @satiety < 4}<h2/>
         <hr/>
        #{links}
        </body>
      </html>
      "
  end

  def template_links
    "<a href='/1'>1</a>
    <a href='/2'>2</a>
    <a href='/3'>3</a>
    <a href='/4'>4</a>
    <a href='/5'>5</a>
    <a href='/6'>6</a>
    <a href='/7'>7</a>
    <a href='/8'>8</a>
    <a href='/9'>9</a>
    <a href='/'>menu</a>
    "
  end

  def forma_html
    "
    <!DOCTYPE html>
    <html lang=\"en\">
      <head>
        <meta charset=\"utf-8\">
        <title>Форма имени</title>
      </head>
      <body>
        <form method='post' action='/name'>
          <label>First name</label><br>
          <input type='text' id='fname' name='fname'>
          <input type='submit' value='Submit'>
        </form>
    <hr/>
    <a href='/'>menu</a>
    </body>
    </html>
    "
  end

  # def characteristics
  #   "#{@name}, #{@race}, #{@level} уровень, у Вас #{@life} жизни, #{@health} здоровья и #{@satiety} сытости."
  # end
  def characteristics
    "#{get('name')}, #{get('race')}, #{@level} уровень, у Вас #{get('life')} жизни, #{get('health')} здоровья и #{get('satiety')} сытости."
  end

  # def characteristics
  #   "#{@request.cookies[("name")]}, #{@request.cookies[("race")]}, #{@request.cookies[("level")]} уровень, у Вас #{@request.cookies[("life")]} жизни, #{@request.cookies[("health")]} здоровья и #{@request.cookies[("satiety")]} сытости."
  # end

end