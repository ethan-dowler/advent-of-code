module Bingo
  class Square
    attr_reader :number, :marked
    alias_method :marked?, :marked

    def initialize(number)
      @number = number.to_i
      @marked = false
    end

    def mark
      @marked = true
    end

    def ==(other)
      number == other
    end
  end
end
