require_relative "sliding_piece"

class Queen < Piece
  include SlidingPiece

  def initialize(board, team, position = nil)
    super(board, team, position)
  end

  def symbol
    "Q"
  end

  def move_dirs
    [:vert, :diag]
  end
end
