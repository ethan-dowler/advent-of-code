class Elf
  attr_reader :snack_calories, :total_calories

  def initialize(calories = [])
    @snack_calories = calories.map(&:to_i)
    @total_calories = snack_calories.sum
  end

  def to_s
    total_calories.to_s
  end
end
