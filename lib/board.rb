# frozen-string-literal: true

require_relative 'knight'

# Instantiates an 8x8 chess board.
class Board
  def initialize
    # 8x8 board: 8 columns of 8 nils (rows)
    # @board[col][row]: Ex. A1 [0, 0], B3 [1, 2]
    @board = Array.new(8) { Array.new(8) }
  end

  # Given start and dest positions represented as arrays (ex. [0,0], [1,2]), checks if the move is valid
  def valid_move?(start, dest)
    # Check if start has a piece there?
    return false if @board[start[0]][start[1]].nil?
    # Make sure that start is within the board
    return false unless start[0].between?(0, 7) && start[1].between?(0, 7)
    # Make sure that end is within the board
    return false unless dest[0].between?(0, 7) && dest[1].between?(0, 7)

    true
  end

  def add_knight(location)
    @board[location[0]][location[1]] = Knight.new(location)
  end
end
