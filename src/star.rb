class Star
  def initialize
    @y_velocity = rand(-5..0)

    @shape = Circle.new(
      x: rand(Window.width),
      y: rand(Window.height),
      z: -2,
      radius: rand(1..2),
      color: "random"
    )
  end

  def move
    @shape.y = (@shape.y + @y_velocity) % Window.height
  end
end
