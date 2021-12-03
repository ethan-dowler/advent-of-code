class SmartTally
  attr_reader :most_common, :least_common

  def initialize(column)
    column_tally = column.tally
    zero_count = column_tally["0"]
    one_count = column_tally["1"]

    @most_common = zero_count > one_count ? "0" : "1"
    @least_common = one_count < zero_count ? "1" : "0"
  end
end
