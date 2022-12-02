require_relative "weapon"


File.open("#{__dir__}/strategy_guide.txt", "r") do |file|
  score =
    file.each_line.reduce(0) do |total, line|
      letters = line.split(" ")
      opponent_weapon, my_weapon = letters.map { |letter| Weapon.from_letter(letter) }
      total + my_weapon.fight(opponent_weapon)
    end

  puts score

  binding.irb
end
