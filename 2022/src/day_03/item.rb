class Item
  attr_reader :priority

  SORTED_ITEMS = [*"a".."z", *"A".."Z"].freeze

  def initialize(character)
    @priority = SORTED_ITEMS.index(character) + 1
  end
end
