require_relative "sliding_piece"

class Bishop < Piece
  include SlidingPiece

  def initialize(board, team, position = nil)
    super(board, team, position)
  end

  def symbol
    "R"
  end

  def move_dirs
    [:diag]
  end
end
