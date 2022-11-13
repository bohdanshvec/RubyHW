module HtmlGame
  protected

def game_menu(link)
  "
      <!DOCTYPE html>
      <html lang=\"en\">
        <head>
          <meta charset=\"utf-8\">
          <meta name='viewport' content='width=device-width, initial-scale=1'>
          <title>Heros menu</title>
            <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi' crossorigin='anonymous'>
              </head>
                <body>
                  <h1>#{characteristics}</h1>
                    <h2>Игра Взломай сейф</h2>
                    <br/>
                    <p>Я загадал код на сейфе из четырех цифр, открой сейф.</p>
                    <p>Цыфры не повторяюся.</p>
                    <p>Угадай и расставь четыре цыфры по своим местах.</p>
                    <hr/>
                    <br/>
                    #{link}
            <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js' integrity='sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3' crossorigin='anonymous'></script>
          </body>
      </html>
      "
end 

def game_list
  "
      <!DOCTYPE html>
      <html lang=\"en\">
        <head>
          <meta charset=\"utf-8\">
          <meta name='viewport' content='width=device-width, initial-scale=1'>
          <title>Heros menu</title>
            <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi' crossorigin='anonymous'>
              </head>
                <body>
                  <h1>#{characteristics}</h1>
                    <h2>Игра Взломай сейф</h2>
                    <br/>
                    <p>Я загадал код на сейфе из четырех цифр, открой сейф.</p>
                    <p>Цыфры не повторяюся.</p>
                    <p>Угадай и расставь четыре цыфры по своим местах.</p>
                    <hr/>
                    <h3>#{@array_views.each {|x| x}}</h3>
                    <hr/>
                    <h2>Введите вашу комбинацию (четыре цыфры)</h2>
                    #{@array_game}
                    <form method='post' action='/game'>
                        <input type='text' name='number'>
                        <button type='submit'>Ввод</button>
                    </form>
                    <br/>
                    #{menu_link}
            <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js' integrity='sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3' crossorigin='anonymous'></script>
          </body>
      </html>
      "
end

def victory
  "
      <!DOCTYPE html>
      <html lang=\"en\">
        <head>
          <meta charset=\"utf-8\">
          <meta name='viewport' content='width=device-width, initial-scale=1'>
          <title>Heros menu</title>
            <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi' crossorigin='anonymous'>
              </head>
                <body>
                  <h1>#{characteristics}</h1>
                    <h2>Игра Взломай сейф</h2>
                    <br/>
                    <h2>VICTORI</h2>
                    <h2>VICTORI</h2>
                    <h2>VICTORI</h2>
                    <br/>
                    <hr/>
                    <h3>Было загадано число #{@number}</h3>
                    <hr/>
                    <h3>Вот статистика Вашей игры:</h3>
                    <h3>#{@array_views}</h3>
                    <br/>
                    #{menu_link}
            <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js' integrity='sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3' crossorigin='anonymous'></script>
          </body>
      </html>
      "
end

def game_link
  "<a href='/'>menu</a>
  <a href='/startgame'>START GAME</a>"
end
def logic_game
  # @number.chars == @array_game ? @array_views << "VICTOPY" : @array_views <<  @number
  @array_views <<  @number

  count_all = 0
  @array_game.each do |x|
    @number.chars.each do |y|
      count_all +=1 if x == y
    end
  end

  count_mesto = 0
  4.times do |x|
    count_mesto += 1 if @array_game[x-1] == @number.chars[x-1]
  end

  otvet = "<= #{count_all} : #{count_mesto}  "

  @array_views << otvet
end
end