class Command
  attr_reader :operation, :magnitude

  def initialize(command_string)
    @operation, @magnitude = command_string.split
    @magnitude = @magnitude.to_i
  end

  def forward?
    operation == "forward"
  end

  def up?
    operation == "up"
  end

  def down?
    operation == "down"
  end
end
