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
    start_pos, end_pos = nil, nil
    while true
      @display.render(@board.current_player, start_pos)
      puts "You are in check" if @board.in_check?(@board.current_player)
      begin
        pos = @display.cursor.get_input
        start_pos, end_pos = evaluate_move(pos, start_pos, end_pos)
      rescue ArgumentError => e
        puts "Error: #{e.message}"
        retry
      end
    end
  end

  def evaluate_move(pos, start_pos, end_pos)
    return start_pos, end_pos if pos.nil?

    if start_pos.nil?
      check_correct_team(pos)
      start_pos = pos
    else
      end_pos = pos
      unless start_pos == end_pos
        @board.move_piece!(start_pos, end_pos)
        @board.switch_players
      end
      start_pos, end_pos = nil, nil
    end

    [start_pos, end_pos]
  end

  def check_correct_team(pos)
    if @board.current_player != @board[pos].team
      raise ArgumentError.new "That is not your piece"
    end
  end
end

g = Game.new
g.play
