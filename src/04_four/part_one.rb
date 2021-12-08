require_relative "bingo"

lines = File.readlines("#{__dir__}/boards.txt", chomp: true)

boards =
  lines.each_slice(6).map do |set|
    rows = set[0..4].map(&:split)
    Bingo::Board.new(rows)
  end

score = Bingo.find_winning_score(boards)

puts score
