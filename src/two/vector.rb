class Vector
  attr_reader :direction, :magnitude

  def initialize(command_string)
    @direction, @magnitude = command_string.split
    @magnitude = @magnitude.to_i
  end

  def x
    if forward?
      magnitude
    else
      0
    end
  end

  def y
    if down?
      magnitude
    elsif up?
      magnitude * -1
    else
      0
    end
  end

  def forward?
    direction == "forward"
  end

  def up?
    direction == "up"
  end

  def down?
    direction == "down"
  end
end
