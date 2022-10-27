class Game

  attr_reader :new_arr
  
  def initialize

    arr = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    @new_arr = arr.shuffle.pop(4)

  end

  def start

    system("clear")

    otvet_array = []

    na_mestah = 0

    puts "Я загадал черырёхзначный код на сейфе, открой сейф."
    puts "exit - выход из игры"

    # блок сверки двух массивов
    while @new_arr != otvet_array
      otvet = gets.chomp

      break if otvet == "exit"

      otvet = otvet.delete(" ")
      otvet_array = otvet.chars

      # блок проверки колличества совпадений
      index = 0
      sovpadenii = 0

      while index < 4
        if @new_arr.include?(otvet_array[index])
          sovpadenii +=1
        end
        index += 1
      end

      puts "       Всего совпадений : #{sovpadenii}"

      # Блок сверки на соответcвие позиции
      index_two = 0
      na_mestah = 0

      while index_two < 4
        if @new_arr[index_two] == otvet_array[index_two]
          na_mestah +=1
        end
        index_two +=1
      end

      puts "       На своих местах : #{na_mestah} \n"
    end

    if na_mestah == 4
    puts "      \n\n Viktori !!!"
    sleep 3
    1
    end

  end
end
