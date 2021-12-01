# https://adventofcode.com/2021/day/1

require 'csv'

# 🍎 TIL __dir__ is a reference to the directory of the file that's running!
depths = CSV.parse(File.read("#{__dir__}/../depths.csv")).flatten.map(&:to_i)

number_of_increases = 0

# we don't want to count the first measurement as an increase
previous_depth = depths.shift # remove first item
depths.each do |depth|
  number_of_increases += 1 if depth > previous_depth

  previous_depth = depth
end

puts number_of_increases
