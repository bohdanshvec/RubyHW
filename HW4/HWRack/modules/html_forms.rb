# Модуль с основными страницами  
module HtmlForms
  protected

  # Шаблон для создания основных страниц
  def template_start(data, links = template_links)
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
                    <h2>#{data}</h2>
                    <h2>#{"Вы проголодались, подкрепитесь !!!" if @satiety < 4}<h2/>
                    <hr/>
                    #{links}
            <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js' integrity='sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3' crossorigin='anonymous'></script>
          </body>
      </html>
      "
  end

  # Линки основного меню
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

  # Форма для ввода имени и рассы
  def forma_html
    "
    <!DOCTYPE html>
    <html lang=\"en\">
      <head>
        <meta charset=\"utf-8\">
        <meta name='viewport' content='width=device-width, initial-scale=1'>
          <title>Форма имени</title>
            <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi' crossorigin='anonymous'>
      </head>
        <body>
          <form method='post' action='/name'>
            <label>First name</label><br>
              <input type='text' name='name'>
                <select name='race'>
                  <option value='Ork'>Ork</option>
                  <option value='Elf'>Elf</option>
                  <option value='Numan'>Human</option>
                  <option value='Dwarf'>Dwarf</option>
                </select>
              <input type='submit' value='Submit'>
          </form>
            <hr/>
            <a href='/'>menu</a>
          <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js' integrity='sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3' crossorigin='anonymous'></script>
        </body>
    </html>
    "
  end
end