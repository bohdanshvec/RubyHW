class Battle
  def initialize(health)
    @rand = rand(50)
    @health = health
  end

  def start
    @health -= @rand
  end
end