# rucksaks
# - two compartments
# - each item has a type
# - each type has a corresponding compartment
# - each rucksack has exactly one item in the wrong compartment
# - each input line has alphabetic characters
# - lowercase and uppercase letters are different items
# - first half of letters = first compartment; second half of letters = second compartment
# - each rucksack has one duplicate item
# - find the duplicate item and convert it to a priority score
# - a..z = 1..26 - A..Z = 27..52
# - find the sum of the priority scores of all duplicate items (one score per rucksack)

require_relative "item"

File.open("#{__dir__}/rucksacks.txt", "r") do |file|
  priority =
    file.each_line.reduce(0) do |total, line|
      line = line.chomp

      first_half_end = (line.length / 2) - 1
      second_half_begin = (line.length / 2)

      compartment_1 = line[..first_half_end].split("")
      compartment_2 = line[second_half_begin..].split("")
      
      shared_characters = compartment_1 & compartment_2
      duplicate = shared_characters.first
      
      total + Item.new(duplicate).priority
    end

  puts priority

  binding.irb
end
