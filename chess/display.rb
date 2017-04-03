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
    cols = %w(0 1 2 3 4 5 6 7)
    rows = %w(a b c d e f g h)

    puts "  #{cols.join(" ")}"
    (0...@board.length).each do |i|
      row = [rows[i]]
      (0...@board.length).each do |j|
        piece = @board[[i, j]].nil? ? "_" : @board[[i, j]].to_s
        piece = piece.colorize(:color => :white, :background => :red) if @cursor.cursor_pos == [i, j]
        row << piece
      end
      puts row.join(" ")
    end
  end
end
