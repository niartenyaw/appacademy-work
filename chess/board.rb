require 'byebug'
require_relative 'pieces/piece.rb'
require_relative 'pieces/king.rb'
require_relative 'pieces/knight.rb'
require_relative 'pieces/rook.rb'

class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def make_starting_grid
    [0, 1, 6, 7].each do |i|
      (0..7).each do |j|
        self[[i,j]] = Queen.new(self, "WHITE", [i,j])
      end
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(from_pos, piece)
    x, y = from_pos
    @grid[x][y] = piece
  end

  def length
    @grid.length
  end

  def dup

  end

  def move_piece!(from_pos, to_pos)
    if self[from_pos].nil?
      raise ArgumentError.new "There is no piece here."
    end

    unless self[to_pos].nil?
      raise ArgumentError.new "There is a piece there"
    end

    possible_moves = self[from_pos].valid_moves
    unless possible_moves.include?(to_pos)
      raise ArgumentError.new "That is not a valid move"
    end

    self[to_pos] = self[from_pos]
    self[from_pos].to_position(to_pos)
    self[from_pos] = nil
  end

  def checkmate?

  end

  def find_king(color)
  end

  def in_bounds?(pos)
    pos.all? { |coord| coord.between?(0, @grid.length - 1) }
  end
end
