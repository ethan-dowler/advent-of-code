class Traveler
  attr_reader :aim, :x, :y

  def initialize(aim: 0, x: 0, y: 0)
    @aim = aim
    @x = x
    @y = y
  end

  def take_command(command)
    if command.up?
      @aim -= command.magnitude
    elsif command.down?
      @aim += command.magnitude
    elsif command.forward?
      @x += command.magnitude
      @y += @aim * command.magnitude
    end
  end
end
