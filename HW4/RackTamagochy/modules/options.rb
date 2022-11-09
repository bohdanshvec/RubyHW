module Options
  protected
  
  def go_eat
    @satiety = 10
  end
  
  def health_down
    rand_down = rand(50)
    @health -= rand_down
  end

  def health_up
    @health < 100 ? rand_up = rand(1..(100 - @health)) : rand_up = 0
    @health += rand_up
  end

  def satiety_down
    @satiety -= 1
  end

  def level_up
    @level += 1
  end
end