require_relative "sliding_piece"

class Bishop < Piece
  include SlidingPiece

  def initialize(board, team, position = nil)
    super(board, team, position)
  end

  def symbol
    "B"
  end

  def move_dirs
    [:diag]
  end
end
