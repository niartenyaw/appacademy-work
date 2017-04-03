require_relative "stepping_piece"

class King < Piece
  include SteppingPiece

  def initialize(board, team, position = nil)
    super(board, team, position)
  end

  def symbol
    "K"
  end

  def team
    @team
  end

  protected

  def move_diffs
    [
      [-1, -1],
      [-1, 0],
      [-1, 1],
      [0, -1],
      [0, 0],
      [0, 1],
      [1, -1],
      [1, 0],
      [1, 1]
    ]
  end
end
