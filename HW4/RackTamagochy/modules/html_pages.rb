module HtmlPages
  protected

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
end