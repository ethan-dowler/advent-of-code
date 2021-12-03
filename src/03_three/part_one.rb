require 'csv'

NUMBER_OF_COLUMNS = 12.freeze

binary_numbers = CSV.read("#{__dir__}/diagnostic_report.csv").flatten

columns = 
  NUMBER_OF_COLUMNS.times.map do |column_number|
    binary_numbers.map do |binary_number|
      binary_number[column_number]
    end
  end

column_tallies = columns.map(&:tally)

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
