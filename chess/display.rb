require_relative "cursor"
require_relative "board"
require "colorize"

class Display

  attr_reader :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    system("clear")
    puts "  #{$COLS.join(" ")}"
    (0...@board.length).each do |i|
      row = [$ROWS[i]]
      (0...@board.length).each do |j|
        piece = @board[[i, j]].nil? ? "_" : @board[[i, j]].to_s
        piece = piece.colorize(:color => :white, :background => :red) if @cursor.cursor_pos == [i, j]
        row << piece
      end
      puts row.join(" ")
    end
  end
end
