require 'csv'
require_relative 'vector'
require_relative 'journey'

vector_inputs = CSV.read("#{__dir__}/commands.csv").flatten

vectors = vector_inputs.map do |input|
  Vector.new(input)
end

journey = Journey.new(vectors)

x, y = journey.destination

puts "Destination: x: #{x}, y: #{y}, total: #{x * y}"
