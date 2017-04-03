require_relative "stepping_piece"

class Knight < Piece
  include SteppingPiece

  def initialize(board, team, position = nil)
    super(board, team, position)
  end

  def symbol
    "N"
  end

  def team
    @team
  end

  protected

  def move_diffs
    [
      [2, 1],
      [2, -1],
      [-2, 1],
      [-2, -1],
      [1, 2],
      [1, -2],
      [-1, 2],
      [-1, -2]
    ]
  end
end
