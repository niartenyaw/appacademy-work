require_relative "board"
require_relative "display"

$COLS = %w(0 1 2 3 4 5 6 7)
$ROWS = %w(a b c d e f g h)

class Game
  def initialize
    @board = Board.new
    @board.make_starting_grid
    @display = Display.new(@board)
  end

  def play
    start_pos = nil
    end_pos = nil
    while true
      @display.render
      pos = @display.cursor.get_input
      start_pos.nil? ? start_pos = pos : end_pos = pos
      if end_pos
        @board.move_piece!(start_pos, end_pos)
        start_pos = nil
        end_pos = nil
      end
    end
  end
end

g = Game.new
g.play
