# https://adventofcode.com/2022/day/1

require_relative "elf"

calories_file = File.read("#{__dir__}/calories.txt")

calories_strings = calories_file.split("\n\n")

elves = calories_strings.map do |string|
  Elf.new(string.split("\n"))
end

puts elves.map(&:total_calories).max

binding.irb
