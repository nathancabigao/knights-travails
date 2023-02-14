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
    # return false if @board[start[0]][start[1]].nil?
    # Make sure that start is within the board
    return false unless start[0].between?(0, 7) && start[1].between?(0, 7)
    # Make sure that end is within the board
    return false unless dest[0].between?(0, 7) && dest[1].between?(0, 7)

    true
  end

  # Takes a starting and ending position for a knight, and prints the shortest path to the ending position
  def knight_moves(start, dest)
    puts 'Not a valid move.' unless valid_move?(start, dest)
    knight = Knight.new(start)
    shortest_path_knight = find_shortest_path(knight, dest)
    puts "You made it in #{shortest_path_knight.history.size - 1} moves! Here's your path:"
    puts shortest_path_knight.history
  end

  def find_shortest_path(knight, dest)
    return nil if knight.nil?

    # queue/level-order traversal, first match is the lowest depth.
    queue = []
    queue << knight
    # add current position to history array (track moves)
    # is the current knight position the dest? if so, return as we have found the path
    until queue.empty?
      front = queue.shift
      front.history << front.location
      return front if front.location == dest

      front.possible_moves.each { |move| queue << Knight.new(move, front.history) unless front.history.include?(move) }
    end
  end
end
