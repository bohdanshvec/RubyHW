require './game_safe.rb'

class Heros

  attr_accessor :name, :race
  # attr_writer :level, :satiety, :life, :health
  # attr_reader :year

  def initialize(name = "User", race = "Человек") 

    @name = name
    @race = race
    @level = 0    # elementary level
    @satiety = 10 # full satiety
    @life = 2     # maximum life
    @health = 100 # full health
    @time_in_game = Time.now
    
  end

  def greetings

    puts
    puts "Очень приятно #{@name}"
    
    @race = race

    puts
    puts "Замечательно, Вас зовут #{@name}, ваша расса #{@race}, #{@level} уровень, у Вас #{@life} жизни, #{@health} здоровья и #{@satiety} сытости."

    sleep 5
    start
    
  end

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

  def start

    system("clear")
    
    characteristics
    puts
    puts "Выбирайте, что будете делать:"
    puts "1. Сражусь с драконом."
    puts "2. Попытаюсь взломать сейф."
    puts "3. Посплю, оно и немного силы восстановит."
    puts "4. Схожу в тринажерный зал."
    puts "5. Поем."
    puts "6. Вывести характеристики моего героя на экран."
    # puts ""
    # puts ""
    puts
    hungry

    choice = gets.chomp.to_i

    until (1..6).include?(choice)
      
      puts "Вы ввели не правильную цифру"
      choice = gets.chomp.to_i

    end

    case 
    when choice == 1
      battle_with_dragon
    when choice == 2
      game_safe
    when choice == 3

    when choice == 4

    when choice == 5

    when choice == 6
      characteristics
      
    end

    sleep 2

  end

  def characteristics

    puts "#{@name}, #{@race}, #{@level} уровень, у Вас #{@life} жизни, #{@health} здоровья и #{@satiety} сытости."
    sleep 2


  end

  def battle_with_dragon

    puts "Вы в логове дракона."
    puts "И как всгда у Вас есть выбор:"
    puts "1. Уйду восвояси, бои не по мне."
    puts "2. Сражусь с ДРАКОНОМ, в АТАКУ !!!"
    

  end

  def game_safe
    game = Game.new
    game.start
    2.times { hungry }
    start
  end

  private

  def level


  end

  def life

    if @satiety < 1 || @health < 1
      puts "Вы потеряли 1 жизнь." 
      life -= 1
    end 

    puts "К сожалению Вы потеряли все жизни, GAME OVER !!!" if @life < 1

  end

  def health_down

    @health -= rand(50)
    life

  end

  def satiety_up

    @satiety = 10

  end

  def hungry

    @satiety -= 1
    puts "Вы голодны, подкрепитесь." if @satiety < 5
    puts "Вы ОЧЕНЬ голодны, рекомендум Вам подкрепиться." if @satiety < 3
    life

  end

end


system("clear")
puts "Добпый день, Вы погружаетесь в интерактивную иргу ГЕРОИ."
puts "Давайте познакомимся, как Вас зовут?"

name = gets.chomp

hero = Heros.new(name)
hero.greetings

# p Heros.instance_methods
# p hero.instance_variables
# hero.game

