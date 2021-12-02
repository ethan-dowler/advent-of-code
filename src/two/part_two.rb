require 'csv'
require_relative 'command'
require_relative 'journey'
require_relative 'traveler'

command_inputs = CSV.read("#{__dir__}/commands.csv").flatten

commands = command_inputs.map do |input|
  Command.new(input)
end

traveler = Traveler.new

commands.each do |command|
  traveler.take_command(command)
end

puts "Destination: x: #{traveler.x}, y: #{traveler.y}, total: #{traveler.x * traveler.y}"
