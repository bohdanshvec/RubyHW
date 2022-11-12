# Модуль методов работы с характеристиками героя
module Options
  protected
  
  # Поднимает сытость до 10
  def go_eat
    @satiety = 10
  end
  
  # Рандомно снижает здоровье
  def health_down
    rand_down = rand(50)
    @health -= rand_down
    life
  end

  # Рандомно поднимает здоровье
  def health_up
    @health < 100 ? rand_up = rand(1..(100 - @health)) : rand_up = 0
    @health += rand_up
  end

  # Снижает сытость на 1
  def satiety_down
    @satiety -= 1
    life
  end

  # Добавляет герою уровень
  def level_up
    @level += 1
  end

  # Отнимает 1 жизнь и восполняет при этом здоровье и сытость до полного
  def life
    if @health < 1 || @satiety < 1
      @life -=1 
      @health = 100
      @satiety = 10
    end
  end
end