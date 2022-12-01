require 'csv'
require_relative "report"

binary_list = CSV.read("#{__dir__}/diagnostic_report.csv").flatten

report = Report.new(binary_list)

column_tallies = report.columns.map(&:tally)
# TODO: create smart tally class!

gamma_rate =
  column_tallies.reduce("") do |rate_string, column_tally|
    zero_count = column_tally["0"]
    one_count = column_tally["1"]

    most_common = zero_count > one_count ? "0" : "1"

    rate_string + most_common
  end

epsilon_rate =
  column_tallies.reduce("") do |rate_string, column_tally|
    zero_count = column_tally["0"]
    one_count = column_tally["1"]

    least_common = zero_count < one_count ? "0" : "1"

    rate_string + least_common
  end

puts gamma_rate.to_i(2) * epsilon_rate.to_i(2)
# => 1025636
