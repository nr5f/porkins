class Projectile
  WIDTH = 6 * 3
  HEIGHT = 6 * 3
  SPEED = 12

  def initialize(x, y, rotate)
    Sound.new(File.join(File.dirname(__FILE__), "..", "assets", "laser.ogg")).play
    @sprite = Sprite.new(
      File.join(File.dirname(__FILE__), "..", "assets", "projectile.png"),
      x: x,
      y: y,
      width: WIDTH,
      height: HEIGHT,
      rotate: rotate
    )

    @x_velocity = Math.sin(@sprite.rotate * Math::PI / 180) * SPEED
    @y_velocity = -Math.cos(@sprite.rotate * Math::PI / 180) * SPEED
  end

  def move
    @sprite.x += @x_velocity
    @sprite.y += @y_velocity
  end
end
