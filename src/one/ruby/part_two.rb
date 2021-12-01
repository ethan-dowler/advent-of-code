# https://adventofcode.com/2021/day/1

require 'csv'

depths = CSV.parse(File.read("#{__dir__}/../depths.csv")).flatten.compact.map(&:to_i)

number_of_increases = 0

# we don't want to count the first measurement window as an increase,
# and we want to stop when we can't make a new measurement window
previous_sum = depths[0..2].sum
depths[1..-2].each_with_index do |current_depth, index|
  second_depth = depths[index + 1]
  third_depth = depths[index + 2]

  sum = current_depth + second_depth + third_depth

  number_of_increases += 1 if sum > previous_sum

  previous_sum = sum
end

puts number_of_increases
