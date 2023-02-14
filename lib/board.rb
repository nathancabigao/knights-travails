# frozen-string-literal: true

require_relative 'knight'

# Instantiates an 8x8 chess board.
class Board
  def initialize
    # 8x8 board: 8 columns of 8 nils (rows)
    # @board[col][row]: Ex. A1 [0, 0], B3 [1, 2]
    @board = Array.new(8) { Array.new(8) }
  end

  def valid_move?(start, dest)
    return false unless start[0].between?(0, 7) && start[1].between?(0, 7)
    return false unless dest[0].between?(0, 7) && dest[1].between?(0, 7)

    true
  end

  def knight_moves(start, dest)
    valid = valid_move?(start, dest)
    puts 'Not a valid move.' unless valid
    return unless valid

    shortest_path_knight = find_shortest_path(start, dest)
    puts "You made it in #{shortest_path_knight.path.size - 1} moves! Here's your path:"
    shortest_path_knight.path.each { |move| p move }
  end

  def find_shortest_path(start, dest)
    queue = []
    queue << Knight.new(start)
    until queue.empty?
      front = queue.shift
      return front if front.location == dest

      front.possible_moves.each { |move| front.children << Knight.new(move, front) }
      front.children.each { |child| queue << child }
    end
  end
end
