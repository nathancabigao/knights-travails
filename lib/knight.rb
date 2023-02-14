# frozen-string-literal: true

# Instantiates a Knight chess piece
class Knight
  attr_accessor :location, :parent, :children

  MOVES = [[-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1]].freeze

  def initialize(location = [0, 0], parent = nil, children = [])
    @location = location
    @parent = parent
    @children = children
  end

  def possible_moves
    possible = []
    MOVES.each do |move|
      new = [@location[0] + move[0], @location[1] + move[1]]
      possible << new if new[0].between?(0, 7) && new[1].between?(0, 7)
    end
    possible
  end

  def path
    current = self
    path = []
    until current.nil?
      path.unshift(current.location)
      current = current.parent
    end
    path
  end
end
