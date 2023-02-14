# frozen-string-literal: true

require_relative 'lib/board'
require_relative 'lib/knight'

b = Board.new
puts 'Testing for knight_moves([0,0], [-1,2]):'
b.knight_moves([0, 0], [-1, 2])
puts "\nTesting for knight_moves([0,0], [0,0]):"
b.knight_moves([0, 0], [0, 0])
puts "\nTesting for knight_moves([0,0], [1,2]):"
b.knight_moves([0, 0], [1, 2])
puts "\nTesting for knight_moves([0,0], [3,3]):"
b.knight_moves([0, 0], [3, 3])
puts "\nTesting for knight_moves([3,3], [0,0]):"
b.knight_moves([3, 3], [0, 0])
puts "\nTesting for knight_moves([3,3], [4,3]):"
b.knight_moves([3, 3], [4, 3])
puts "\nTesting for knight_moves([0,0], [7,7]):"
b.knight_moves([0, 0], [7, 7])
