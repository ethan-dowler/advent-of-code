require_relative "weapon"

module Outcome
  def self.from_letter(letter)
    case letter
    when "X"
      Loss
    when "Y"
      Draw
    when "Z"
      Win
    end
  end

  module Loss
    def self.my_weapon(opponent_weapon)
      case
      when opponent_weapon.is_a?(Weapon::Rock)
        Weapon::Scissors.new
      when opponent_weapon.is_a?(Weapon::Paper)
        Weapon::Rock.new
      when opponent_weapon.is_a?(Weapon::Scissors)
        Weapon::Paper.new
      end
    end
  end

  module Draw
    def self.my_weapon(opponent_weapon) = opponent_weapon.class.new
  end

  module Win
    def self.my_weapon(opponent_weapon)
      case
      when opponent_weapon.is_a?(Weapon::Rock)
        Weapon::Paper.new
      when opponent_weapon.is_a?(Weapon::Paper)
        Weapon::Scissors.new
      when opponent_weapon.is_a?(Weapon::Scissors)
        Weapon::Rock.new
      end
    end
  end
end
