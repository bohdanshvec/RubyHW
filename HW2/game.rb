require './game_safe.rb'

class Heros

  attr_accessor :name, :race

  def initialize(name = "User", race = "Человек") 

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
    
    @race = race

    puts
    puts "Замечательно, Вас зовут #{@name}, ваша расса #{@race}, #{@level} уровень, у Вас #{@life} жизни, #{@health} здоровья и #{@satiety} сытости."

    sleep 3
    start
    
  end

  # Метод выбора рассы.
  def race
    
    puts "Выберите одну из предложенных расс:"
    puts
    puts "1. Гном"
    puts "2. Эльф"
    puts "3. Человек"
    puts "4. Варвар"
    
    x = gets.chomp.to_i
    
    until (1..4).include?(x)
      
      puts "Вы ввели не правильную цифру"
      x = gets.chomp.to_i

    end

    case
    when x == 1
      "Гном"
    when x == 2
      "Эльф"
    when x == 3
      "Человек"
    when x == 4
      "Варвар"
    end
  
  end

  # Основной метод, куда всегда будут возвращатся, фактически меню игры.
  def start

    system("clear")
    
    characteristics
    puts
    puts "Выбирайте, что будете делать:"
    puts "1. Сражусь с драконом."
    puts "2. Попытаюсь взломать сейф."
    puts "3. Посплю, оно и немного силы восстановит."
    puts "4. Схожу в тренажерный зал."
    puts "5. Пойду поем."
    puts "6. Вывести характеристики моего героя на экран."
    puts "7. Посмотреть общее время нахождения в игре."
    puts "8. Правила игры"
    puts 
    puts "9. - выход из игры"
    puts

    choice = gets.chomp.to_i

    until (1..9).include?(choice)
      
      puts "Вы ввели не правильную цифру"
      choice = gets.chomp.to_i

    end

    # call gem logic that save html

    case 
    when choice == 1
      battle_with_dragon
      start
    when choice == 2
      game_safe
      start
    when choice == 3
      sleeper
      hungry
      start
    when choice == 4
      do_sport
      hungry
      start
    when choice == 5
      satiety_up
      start
    when choice == 6
      characteristics
      hungry
      start
    when choice == 7
      timer
      hungry
      start
    when choice == 8
        prompt
    when choice == 9
      the_end
    end

  end

  # Метод окончания игры.
  def the_end

    puts
    puts "Прощай герой #{@name}, до новых встречь."
    sleep 2
    system("clear")
    exit

  end

  # Метод выводящий инструкцию к игре.
  def prompt

    puts "   В этой игре Вы герой у вас есть ограниченных 2 жизни, по 100 здоровья в каждой и ограниченная сытость(10)."
    puts "   В начале игры Вы 0-ого уровня, но с каждыми активными действиями Ваш уровень будет расти."
    puts "   Вы можете терять здоровье, но всегда и можете его пополнить."
    puts "   Будете постепенно (выполняя действия) терять сытость, но всегда сможете поесть."
    puts
    puts "   Приятной ИГРЫ."
    puts
    puts "1. Вернуться в главное меню."

    x = gets.chomp.to_i
    until x == 1
      
      puts "Вы ввели не правильную цифру"
      x = gets.chomp.to_i

    end

    start

  end    


  # Метод выводящий характеристики героя.
  def characteristics

    puts "#{@name}, #{@race}, #{@level} уровень, у Вас #{@life} жизни, #{@health} здоровья и #{@satiety} сытости."
    puts

  end

  # Бой с драконом.
  def battle_with_dragon

    system("clear")

    puts "Вы в логове дракона."
    puts "И как всгда у Вас есть выбор:"
    puts
    puts "1. Уйду восвояси, бои не по мне."
    puts "2. Сражусь с ДРАКОНОМ, в АТАКУ !!!"
    puts "3. Правила игры"
    
    c = gets.chomp.to_i

    until (1..3).include?(c)
      
      puts "Вы ввели не правильную цифру"
      c = gets.chomp.to_i

    end

    if c == 1
      hungry
      sleep 1
      start
    elsif c == 2
      puts "УДАР - УДАР - УВОРОТ - КРОВЬ !!!!"
      health_down
      level
      battle_with_dragon
    elsif c == 3
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
      puts "Вам не нужно спать."
    else
      puts "Пока вы спите, ваше здоровье восстановиться."
      puts
      10.times { |x| print x; sleep 0.5 }
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
      puts "Вам не нужно заниматься спортом."
    else
      puts "Раз - Два - Три  - Четыре - Пять, заряжаешься опять."
      puts
      10.times { |x| print x.to_s + " #{ ["):", "(:", "[:", "]:", "{:", "};"].sample }"; sleep 0.5 }
      puts
      health_up
      puts "Ваше текущее здоровье: #{@health}"
    end

    sleep 2

  end

  # Метод, в котором определяется время нахождения героя в игре (от начала и до данного момента).
  def timer

    t = Time.now - @time_in_game
    case
    when t < 60
      puts "Вы в игре всего лишь #{t.to_i} секунд."
    when t.to_i.between?(60, 3600)
      puts "Вы в игре #{t.to_i / 60} минут и #{t.to_i % 60} секунд."
    end

  end



  private

  # Метод добавляющий уровень герою.
  def level

    @level += 1

  end

  # Метод, добавляющий здоровье герою.
  def health_up
 
    z = rand(1..(100-@health))
    @health += z

  end

  # Метод контролирующий жизни героя и отнимающий их.
  def life

    if @satiety < 1 || @health < 1
      puts "Вы потеряли 1 жизнь." 
      @life -= 1
      @satiety = 10
      @health = 100
      sleep 2
    end 

    if @life < 1
      puts "К сожалению Вы потеряли все жизни, GAME OVER !!!" 
      puts
      the_end
    end

  end

  # Метод отнимающий сытость.
  def hungry

    @satiety -= 1
      puts "Вы голодны, подкрепитесь." if (3..4).include?(@satiety)
      puts "Вы ОЧЕНЬ голодны, рекомендум Вам подкрепиться." if (1..2).include?(@satiety)
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
    characteristics
    life

  end

  # Метод поднимающий сытость до максимума.
  def satiety_up

    @satiety = 10
    puts "Ам - Ам - Чявк, я кушаю."
    sleep 2

  end

end


system("clear")
puts "Добпый день, Вы погружаетесь в интерактивную иргу ГЕРОИ."
puts "Давайте познакомимся, как Вас зовут?"

name = gets.chomp

hero = Heros.new(name)
hero.greetings

