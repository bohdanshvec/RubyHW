require './game_safe'
require 'save_to_html'

class Heros
  attr_accessor :name, :race

  def initialize(name = 'User', race = 'Человек')
    @name = name
    @race = race
    @level = 0    # elementary level
    @satiety = 10 # full satiety
    @life = 2     # maximum life
    @health = 100 # full health
    @time_in_game = Time.new # time start game
  end

  # Метод приветствия, начало игры.
  def greetings
    puts
    puts "Очень приятно #{@name}"

    @race = choose_race

    puts
    puts "Замечательно, Вас зовут #{@name}, ваша расса #{@race}, #{@level} уровень, у Вас #{@life} жизни, #{@health} здоровья и #{@satiety} сытости."

    sleep 3
    start
  end

  # Метод выбора рассы.
  def choose_race
    puts 'Выберите одну из предложенных расс:'
    puts
    puts '1. Гном'
    puts '2. Эльф'
    puts '3. Человек'
    puts '4. Варвар'

    x = gets.chomp.to_i

    until (1..4).include?(x)

      puts 'Вы ввели не правильную цифру'
      x = gets.chomp.to_i

    end

    case x
    when 1
      'Гном'
    when 2
      'Эльф'
    when 3
      'Человек'
    when 4
      'Варвар'
    end
  end

  # Основной метод, куда всегда будут возвращатся, фактически меню игры.
  def start
    save_user_stats_html

    system('clear')

    puts characteristics
    puts
    puts 'Выбирайте, что будете делать:'
    puts '1. Сражусь с драконом.'
    puts '2. Попытаюсь взломать сейф.'
    puts '3. Посплю, оно и немного силы восстановит.'
    puts '4. Схожу в тренажерный зал.'
    puts '5. Пойду поем.'
    puts '6. Вывести характеристики моего героя на экран.'
    puts '7. Посмотреть общее время нахождения в игре.'
    puts '8. Правила игры'
    puts
    puts '9. - выход из игры'
    puts

    choice = gets.chomp.to_i

    until (1..9).include?(choice)

      puts 'Вы ввели не правильную цифру'
      choice = gets.chomp.to_i

    end

    case choice
    when 1
      battle_with_dragon
      start
    when 2
      game_safe
      save_user_stats_html
      start
    when 3
      sleeper
      hungry
      save_user_stats_html
      start
    when 4
      do_sport
      hungry
      save_user_stats_html
      start
    when 5
      satiety_up
      save_user_stats_html
      start
    when 6
      puts characteristics
      hungry
      save_user_stats_html
      start
    when 7
      timer
      hungry
      save_user_stats_html
      start
    when 8
      prompt
    when 9
      the_end
    end
  end

  # Метод окончания игры.
  def the_end
    puts
    puts "Прощай герой #{@name}, до новых встречь."
    sleep 2
    system('clear')
    exit
  end

  # Метод выводящий инструкцию к игре.
  def prompt
    puts '   В этой игре Вы герой у вас есть ограниченных 2 жизни, по 100 здоровья в каждой и ограниченная сытость(10).'
    puts '   В начале игры Вы 0-ого уровня, но с каждыми активными действиями Ваш уровень будет расти.'
    puts '   Вы можете терять здоровье, но всегда и можете его пополнить.'
    puts '   Будете постепенно (выполняя действия) терять сытость, но всегда сможете поесть.'
    puts
    puts '   Приятной ИГРЫ.'
    puts
    puts '1. Вернуться в главное меню.'

    x = gets.chomp.to_i
    until x == 1

      puts 'Вы ввели не правильную цифру'
      x = gets.chomp.to_i

    end

    start
  end

  # Метод выводящий характеристики героя.
  def characteristics
    smail_life = nil
    case @life
    when 2
      smail_life = "\u{1F603}"
    when 1
      smail_life = "\u{1F612}"
    when 0
      smail_life = "\u{1F480}"
    end

    smail_health = nil
    if @health.between?(60, 100)
      smail_health = "\u{1F4AA}"
    elsif @health.between?(30, 59)
      smail_health = "\u{1F49C}"
    elsif @health.between?(1, 29)
      smail_health = "\u{1F5A4}"
    end

    smail_satiety = nil
    if @satiety.between?(6, 10)
      smail_satiety = "\u{1F44C}"
    elsif @satiety.between?(1, 5)
      smail_satiety = "\u{1F44E}"
    end

    "#{@name}, #{@race}, #{@level} уровень, у Вас #{@life} #{smail_life} жизни, #{@health} #{smail_health} здоровья и #{@satiety} #{smail_satiety} сытости."
  end

  # Бой с драконом.
  def battle_with_dragon
    system('clear')

    puts 'Вы в логове дракона.'
    puts 'И как всгда у Вас есть выбор:'
    puts
    puts '1. Уйду восвояси, бои не по мне.'
    puts '2. Сражусь с ДРАКОНОМ, в АТАКУ !!!'
    puts '3. Правила игры'

    c = gets.chomp.to_i

    until (1..3).include?(c)

      puts 'Вы ввели не правильную цифру'
      c = gets.chomp.to_i

    end

    case c
    when 1
      hungry
      sleep 1
      start
    when 2
      puts 'УДАР - УДАР - УВОРОТ - КРОВЬ !!!!'
      health_down
      level
      save_user_stats_html
      battle_with_dragon
    when 3
      prompt
    end
  end

  # Игра СЕЙФ.
  def game_safe
    game = Game.new

    if game.start == 1
      2.times { hungry }
      2.times { level }
    else
      hungry
    end
  end

  # Метод, в котором герой спит.
  def sleeper
    if @health == 100
      puts "Вы полностью зворовы: #{@health}"
      puts 'Вам не нужно спать.'
    else
      puts 'Пока вы спите, ваше здоровье восстановиться.'
      puts
      10.times do |x|
        print x
        sleep 0.5
      end
      puts
      health_up
      puts "Ваше текущее здоровье: #{@health}"
    end

    sleep 2
  end

  # Метод в котором герой занимается спортом.
  def do_sport
    if @health == 100
      puts "Вы полностью зворовы: #{@health}"
      puts 'Вам не нужно заниматься спортом.'
    else
      puts 'Раз - Два - Три  - Четыре - Пять, заряжаешься опять.'
      puts
      10.times do |x|
        print x.to_s + " #{['):', '(:', '[:', ']:', '{:', "}\n"].sample}"
        sleep 0.5
      end
      puts
      health_up
      puts "Ваше текущее здоровье: #{@health}"
    end

    sleep 2
  end

  # Метод, в котором определяется время нахождения героя в игре (от начала и до данного момента).
  def timer
    t = Time.now - @time_in_game
    if t < 60
      puts "Вы в игре всего лишь #{t.to_i} секунд."
    elsif t.to_i.between?(60, 3600)
      puts "Вы в игре #{t.to_i / 60} минут и #{t.to_i % 60} секунд."
    end
  end

  private

  # Метод запускающий подключенный гем
  def save_user_stats_html
    new_file_html = SaveToHtml.new(content: characteristics, bypass_html: true, name: @name)
    new_file_html.create
  end

  # Метод добавляющий уровень герою.
  def level
    @level += 1
  end

  # Метод, добавляющий здоровье герою.
  def health_up
    z = rand(1..(100 - @health))
    @health += z
  end

  # Метод контролирующий жизни героя и отнимающий их.
  def life
    if @satiety < 1 || @health < 1
      puts 'Вы потеряли 1 жизнь.'
      @life -= 1
      @satiety = 10
      @health = 100
      save_user_stats_html
      sleep 2
    end

    return unless @life < 1

    puts 'К сожалению Вы потеряли все жизни, GAME OVER !!!'
    puts
    the_end
  end

  # Метод отнимающий сытость.
  def hungry
    @satiety -= 1
    puts 'Вы голодны, подкрепитесь.' if (3..4).include?(@satiety)
    puts 'Вы ОЧЕНЬ голодны, рекомендум Вам подкрепиться.' if (1..2).include?(@satiety)
    sleep 3
    life
  end

  # Метод уменьшающий здоровье.
  def health_down
    z = rand(50)
    @health -= z
    puts "Дракон сильнее Вас, он нанес Вам #{z} урона и теперь ваше здоровье #{@health}"
    2.times { hungry }
    puts
    puts characteristics
    life
  end

  # Метод поднимающий сытость до максимума.
  def satiety_up
    @satiety = 10
    puts 'Ам - Ам - Чявк, я кушаю.'
    sleep 2
  end
end

system('clear')
puts 'Добпый день, Вы погружаетесь в интерактивную иргу ГЕРОИ.'
puts 'Давайте познакомимся, как Вас зовут?'

name = gets.chomp

hero = Heros.new(name)
hero.greetings
