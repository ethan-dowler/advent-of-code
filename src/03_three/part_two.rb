require 'csv'
require_relative "report"
require_relative "smart_tally"

binary_list = CSV.read("#{__dir__}/diagnostic_report.csv").flatten

report = Report.new(binary_list)

column_tallies = report.columns.map do |column|
  SmartTally.new(column)
end

gamma_rate =
  column_tallies.reduce("") do |rate_string, column_tally|
    rate_string + column_tally.most_common
  end

epsilon_rate =
  column_tallies.reduce("") do |rate_string, column_tally|
    rate_string + column_tally.least_common
  end

puts gamma_rate.to_i(2) * epsilon_rate.to_i(2)
# => 1025636
