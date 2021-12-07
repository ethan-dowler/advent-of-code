require 'csv'
require_relative "report"
require_relative "smart_tally"

binary_list = CSV.read("#{__dir__}/diagnostic_report.csv").flatten

original_report = Report.new(binary_list)

rows = original_report.rows
bit_position = 0
while rows.length > 1 && bit_position < 12 do
  current_report = Report.new(rows)
  current_column = current_report.columns[bit_position]
  smart_tally = SmartTally.new(current_column)

  rows_to_delete = []
  rows.each do |row|
    # O2 Rating
    if row.chars[bit_position] == smart_tally.most_common
    # CO2 Rating
    # if row.chars[bit_position] == smart_tally.least_common
      next
    else
      rows_to_delete.push(row)
    end
  end
  rows -= rows_to_delete
  bit_position += 1
end

if rows.length == 1
  puts "O2 Generator Rating: #{rows.first}"
else
  puts "Too many rows:"
  puts rows
end
# O2 rating: 110000010001 => 3089
# CO2 rating: 000100000001 => 257
# Life Support rating: 793,873
