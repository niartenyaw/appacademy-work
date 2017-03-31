require_relative 'tic_tac_toe'

class TicTacToeNode

  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)

  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    nodes = []
    @board.rows.each_index do |row_i|
      @board.rows[row_i].each_index do |col_i|
        if @board.rows[row_i][col_i].nil?
          new_rows = deep_dup(@board.rows)
          new_rows[row_i][col_i] = @next_mover_mark
          new_board = Board.new(new_rows)
          new_marker = @next_mover_mark == :x ? :o : :x
          nodes << TicTacToeNode.new(new_board, new_marker, [row_i, col_i])
        end
      end
    end
    nodes
  end

  def deep_dup(b)
    new_b = []
    b.each { |row| new_b << row.dup }
  end
end
