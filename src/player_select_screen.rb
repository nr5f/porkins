class PlayerSelectScreen
  def initialize
    @stars = Array.new(100).map{ Star.new }

    subtitle_text = Text.new("The New Republic Fifth Fleet Presents", size: 18, y: 15)
    subtitle_text.x = (Window.width - subtitle_text.width) / 2

    title_text = Text.new("PORKINS", size: 72, y: 40)
    title_text.x = (Window.width - title_text.width) / 2

    player_select_text = Text.new("Select Your Ship", size: 32, y: 130)
    player_select_text.x = (Window.width - player_select_text.width) / 2

    instruction_text = Text.new("Arrow Keys: Move   Space: Select/Shoot", size: 18, y: 575)
    instruction_text.x = (Window.width - instruction_text.width) / 2

    @players = [
      Player.new(File.join(File.dirname(__FILE__), "..", "assets", "player_1.png"), "A-Wing", Window.width * (1/4.0) - Player::WIDTH / 2, 240, 100, 60),
      Player.new(File.join(File.dirname(__FILE__), "..", "assets", "player_2.png"), "X-Wing", Window.width * (2/4.0) - Player::WIDTH / 2, 240, 80, 80),
      Player.new(File.join(File.dirname(__FILE__), "..", "assets", "player_3.png"), "Y-Wing", Window.width * (3/4.0) - Player::WIDTH / 2, 240, 60, 100)
    ]

    @selected_player = 1

    animate_players
    add_player_masks
    set_player_stat_text
  end

  def update
    if Window.frames % 2 == 0
      @stars.each { |star| star.move }
    end
  end

  def animate_players
    @players.each_with_index do |player, index|
      if index == @selected_player
        player.animate_fast
      else
        player.animate_slow
      end
    end
  end

  def move(direction)
    if direction == :left
      @selected_player = (@selected_player - 1) % 3
    else
      @selected_player = (@selected_player + 1) % 3
    end

    animate_players
    add_player_masks
    set_player_stat_text
  end

  def add_player_masks
    @player_masks && @player_masks.each { |mask| mask.remove }

    @player_masks = @players.each_with_index.map do |player, index|
      if index == @selected_player
        color = [0.2, 0.2, 0.2, 0.6]
        z = -1
      else
        color = [0.0, 0.0, 0.0, 0.4]
        z = 2
      end

      Circle.new(
        radius: 100,
        sectors: 32,
        x: player.x + (Player::WIDTH / 2),
        y: player.y + (Player::HEIGHT / 2),
        z: z,
        color: color
      )
    end
  end

  def set_player_stat_text
    @player_stat_texts && @player_stat_texts.each { |text| text.remove }

    @player_stat_texts = []
    @players.each_with_index do |player, index|
      if index == @selected_player
        color = Color.new([1, 1, 1, 1])
      else
        color = Color.new([0.3, 0.3, 0.3, 0.3])
      end

      type_text = Text.new(player.type, size: 20, y: player.y + 200, color: color)
      type_text.x = player.x + ((Player::WIDTH - type_text.width) / 2)

      speed_text = Text.new("Speed: #{player.speed}", size: 20, y: player.y + 220, color: color)
      speed_text.x = player.x + ((Player::WIDTH - speed_text.width) / 2)

      fire_rate_text = Text.new("Fire Rate: #{player.fire_rate}", size: 20, y: player.y + 240, color: color)
      fire_rate_text.x = player.x + ((Player::WIDTH - fire_rate_text.width) / 2)

      @player_stat_texts.push(type_text)
      @player_stat_texts.push(speed_text)
      @player_stat_texts.push(fire_rate_text)
    end
  end

  def selected_player
    @players[@selected_player]
  end
end
