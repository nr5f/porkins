class GameScreen
  MAX_ENEMIES = 8

  def initialize(player)
    @music = Music.new(File.join(File.dirname(__FILE__), "..", "assets", "tie_fighter_attack.ogg"))
    @music.volume = 25
    @music.loop = true
    @music.play
    @stars = Array.new(100).map { Star.new }
    @player = Player.new(player.image, player.type, player.x, player.y, player.speed, player.fire_rate)
    @player.animate_slow
    @enemies = []
  end

  def update
    if Window.frames % 2 == 0
      @stars.each { |star| star.move }
    end

    if Window.frames % 120 == 0 && @enemies.size <= MAX_ENEMIES
      @enemies.push(Enemy.new)
    end

    @enemies.each { |enemy| enemy.move }
    @player.move
    @player.slow_down
    @music.resume
  end

  def rotate_player(direction)
    @player.rotate(direction)
  end
  
  def accelerate_player(direction)
    @player.accelerate(direction)
  end
  
  def stop_accelerating_player
    @player.stop_accelerating
  end

  def player_fire_projectile
    @player.fire_projectile
  end
end
