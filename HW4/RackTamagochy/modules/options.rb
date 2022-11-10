module Options
  protected
  
  def go_eat
    @satiety = 10
  end
  
  def health_down
    rand_down = rand(50)
    @health -= rand_down
    life
  end

  def health_up
    @health < 100 ? rand_up = rand(1..(100 - @health)) : rand_up = 0
    @health += rand_up
  end

  def satiety_down
    @satiety -= 1
    life
  end

  def level_up
    @level += 1
  end

  def life
    if @health < 1 || @satiety < 1
      @life -=1 
      @health = 100
      @satiety = 10
    end
  end
end