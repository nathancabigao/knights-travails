# frozen-string-literal: true

# Instantiates an 8x8 chess board.
class Board
  def initialize
    @board = Array.new(8) { Array.new(8) } # 8x8 board: 8 rows of 8 nils (columns)
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
end
