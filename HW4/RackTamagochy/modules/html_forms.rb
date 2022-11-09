module HtmlForms
  protected

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

end