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
    available_moves = moves

    curr_board = @board.dupped ? @board : @board.dup
    available_moves.each do |move|
      curr_board.move_piece!(@position, move)

      if new_board.in_check?(@team)
        available_moves.delete(move)
      end

      @board.move_piece!(move, @position)
    end
    p available_moves
    available_moves
  end

  def team
    @team
  end

  def same_team?(piece)
    piece.team == @team
  end

  def to_position(pos)
    @position = pos
  end

  private

  def move_into_check?(end_pos)
    board_dup = @board.dup
  end
end
