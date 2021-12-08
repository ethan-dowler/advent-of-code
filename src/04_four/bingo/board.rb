module Bingo
  class Board
    attr_reader :rows

    def initialize(rows)
      @rows = rows.map do |row|
        row.map do |number|
          Square.new(number)
        end
      end
    end

    def mark(number)
      square = find_square(number)
      return if square.nil?

      square.mark
    end

    def contains?(number)
      !find_square(number).nil?
    end

    def winning?
      any_rows_winning? || any_columns_winning?
    end

    def score(winning_number)
      return 0 unless winning?

      unmarked_square_total =
        unmarked_squares.reduce(0) do |total, square|
          total + square.number
        end

      unmarked_square_total * winning_number
    end

  private

    def any_rows_winning?
      rows.any? do |row|
        row.all?(&:marked?)
      end
    end

    def any_columns_winning?
      rows.transpose.any? do |column|
        column.all?(&:marked?)
      end
    end

    def find_square(number)
      rows.each do |row|
        row.each do |square|
          return square if square == number
        end
      end
      nil
    end

    def unmarked_squares
      rows.flat_map do |row|
        row.reduce([]) do |unmarked_squares, square|
          if square.marked?
            unmarked_squares
          else
            unmarked_squares.push(square)
          end
        end
      end
    end
  end
end
