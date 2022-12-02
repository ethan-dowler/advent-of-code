# https://adventofcode.com/2022/day/1

require_relative "elf"

calories_file = File.read("#{__dir__}/calories.txt")

calories_strings = calories_file.split("\n\n")

elves = calories_strings.map do |string|
  Elf.new(string.split("\n"))
end

top_three = elves.sort_by(&:total_calories)[-3..]

puts top_three.sum(&:total_calories)

binding.irb
