require_relative "outcome"
require_relative "weapon"

File.open("#{__dir__}/strategy_guide.txt", "r") do |file|
  score =
    file.each_line.reduce(0) do |total, line|
      letters = line.split(" ")
      opponent_weapon = Weapon.from_letter(letters[0])
      outcome = Outcome.from_letter(letters[1])
      my_weapon = outcome.my_weapon(opponent_weapon)
      total + my_weapon.fight(opponent_weapon)
    end

  puts score

  binding.irb
end
