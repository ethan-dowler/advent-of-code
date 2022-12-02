module Weapon
  def self.from_letter(letter)
    case letter
    when /(A|X)/
      Rock.new
    when /(B|Y)/
      Paper.new
    when /(C|Z)/
      Scissors.new
    end
  end

  class Base
    WIN_SCORE = 6
    DRAW_SCORE = 3
    LOSE_SCORE = 0

    def type = :unknown
    def score = 0
    def fight(other) = lose

  private

    def win = score + WIN_SCORE
    def draw = score + DRAW_SCORE
    def lose = score + LOSE_SCORE
  end

  class Rock < Base
    def type = :rock
    def score = 1

    def fight(other)
      case
      when other.is_a?(Rock)
        draw
      when other.is_a?(Paper)
        lose
      when other.is_a?(Scissors)
        win
      end
    end
  end

  class Paper < Base
    def type = :paper
    def score = 2
      
    def fight(other)
      case
      when other.is_a?(Rock)
        win
      when other.is_a?(Paper)
        draw
      when other.is_a?(Scissors)
        lose
      end
    end
  end

  class Scissors < Base
    def type = :scissors
    def score = 3

    def fight(other)
      case
      when other.is_a?(Rock)
        lose
      when other.is_a?(Paper)
        win
      when other.is_a?(Scissors)
        draw
      end
    end
  end
end
