require_relative "weapon"


File.open("#{__dir__}/strategy_guide.txt", "r") do |file|
  score =
    file.each_line.reduce(0) do |total, line|
      letters = line.split(" ")
      call, response = letters.map { |letter| Weapon.from_letter(letter) }
      total + response.fight(call)
    end

  puts score

  binding.irb
end
