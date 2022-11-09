module HtmlForms
  protected

  def template_start(data, links = template_links)
    "
      <!DOCTYPE html>
      <html lang=\"en\">
        <head>
          <meta charset=\"utf-8\">
          <title>Тестовая страница</title>
        </head>
        <body>
        <h1>#{characteristics}</h1>
        <h2>#{data}</h2>
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

  def battle_links
    "<a href='/'>1</a>
    <a href='/battle?step=2'>2</a>
    <a href='/battle?step=3'>3</a>
    <a href='/'>menu</a>
    "
  end

  def battle_with_dragon
    "<h3>Вы в логове дракона.<br/>
    И как всгда у Вас есть выбор:<br/>
    <br/>
    1. Уйду восвояси, бои не по мне.<br/>
    2. Сражусь с ДРАКОНОМ, в АТАКУ !!!<br/>
    3. Правила игры</h3>"
  end

  def text_battle
    "<h3>aaaaaaaa<br/>
    И как всгда у Вас есть выбор:<br/>
    <br/>
    1. aaaaaaaaaaa<br/>
    2. aaaaaaaaaaa!!!<br/>
    3. aaaaaaaaaa</h3>"
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

  def exit_gem
    exit
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
  
end