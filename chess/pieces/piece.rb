require_relative "../board.rb"

class Piece
  def initialize(board, team, position = nil)
    @board = board
    @team = team
    @position = position
  end

  def to_s
    symbol
  end

  def empty?
  end

  def symbol
  end

  def valid_moves
    moves
    # Make sure no moves allow for check or checkmate
  end

  def to_position(pos)
    @position = pos
  end

  private

  def move_into_checks(to_pos)
  end
end
