require_relative "cursor"
require_relative "board"
require "colorize"

class Display

  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render(current_player_color, start_pos)
    system("clear")
    puts "  #{$COLS.join("  ")}"
    (0...@board.length).each do |i|
      row = [$ROWS[i]]
      (0...@board.length).each do |j|
        color = (i + j).odd? ? :light_white : :white
        color = :black if start_pos && [i, j] == start_pos
        piece = " #{@board[[i, j]].to_s} ".colorize(:color => @board[[i,j]].team, :background=>color)
        if @cursor.cursor_pos == [i, j]
          cursor_colors = {:color => :light_white,
            :background => current_player_color}
          piece = piece.colorize(cursor_colors)
        end
        row << piece
      end
      puts row.join("")
    end
  end
end
