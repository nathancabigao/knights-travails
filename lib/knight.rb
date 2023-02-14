# frozen-string-literal: true

# Instantiates a Knight chess piece
class Knight
  attr_accessor :location, :history

  MOVES = [[-2, 1], [-1, 2], [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1]].freeze

  def initialize(location = [0, 0], history = [])
    @location = location
    @history = history
  end

  # Given the knight's location, returns an array of all the possible moves
  def possible_moves
    possible = []
    MOVES.each do |move|
      new = @location + move
      possible << new if new[0].between?(0, 7) && new[1].between?(0, 7)
    end
    possible
  end
end
