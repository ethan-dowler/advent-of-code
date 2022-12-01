class Report
  NUMBER_OF_COLUMNS = 12.freeze

  attr_reader :rows, :columns, :gamma_rating, :epsilon_rating, :oxygen_generator_rating, :co2_scrubber_rating

  def initialize(binary_list)
    @rows = binary_list
    @columns =
      NUMBER_OF_COLUMNS.times.map do |column_number|
        binary_list.map do |binary_number|
          binary_number[column_number]
        end
      end
    # @columns = rows.map { |row| row.split("") }.transpose
  end
end
