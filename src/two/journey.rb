class Journey
  attr_reader :vectors

  def initialize(vectors)
    @vectors = vectors
  end

  def destination
    x = 0
    y = 0

    vectors.each do |vector|
      x += vector.x
      y += vector.y
    end

    [x, y]
  end
end
