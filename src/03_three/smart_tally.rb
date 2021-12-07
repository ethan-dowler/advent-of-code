class SmartTally
  attr_reader :most_common, :least_common

  def initialize(bit_array)
    bit_array_tally = bit_array.tally
    zero_count = bit_array_tally["0"]
    one_count = bit_array_tally["1"]

    @most_common = zero_count > one_count ? "0" : "1"
    @least_common = one_count < zero_count ? "1" : "0"
  end
end
