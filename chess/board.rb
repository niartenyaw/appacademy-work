require 'byebug'
require_relative 'pieces/piece.rb'
require_relative 'pieces/king.rb'
require_relative 'pieces/knight.rb'
require_relative 'pieces/rook.rb'
require_relative 'pieces/bishop.rb'
require_relative 'pieces/queen.rb'
require_relative 'pieces/null_piece.rb'
require_relative 'pieces/pawn.rb'

class Board

  attr_reader :current_player, :dupped

  def initialize(dupped = false)
    @grid = Array.new(8) { Array.new(8) }
    @current_player = :cyan
    @player_colors = [:cyan, :magenta]
    @dupped = dupped
  end

  def make_starting_grid
    place_null_pieces
    place_main_pieces(0, :magenta)
    place_main_pieces(7, :cyan)
    place_pawns(1, :magenta)
    place_pawns(6, :cyan)
  end

  def place_main_pieces(row, color)
    self[[row, 0]] = Rook.new(self, color, [row, 0])
    self[[row, 1]] = Knight.new(self, color, [row, 1])
    self[[row, 2]] = Bishop.new(self, color, [row, 2])
    self[[row, 3]] = Queen.new(self, color, [row, 3])
    self[[row, 4]] = King.new(self, color, [row, 4])
    self[[row, 5]] = Bishop.new(self, color, [row, 5])
    self[[row, 6]] = Knight.new(self, color, [row, 6])
    self[[row, 7]] = Rook.new(self, color, [row, 7])
  end

  def place_null_pieces
    (0..7).each do |i|
      (0..7).each do |j|
        self[[i, j]] = NullPiece.instance
      end
    end
  end

  def place_pawns(row, color)
    (0..7).each do |i|
      self[[row, i]] = Pawn.new(self, color, [row, i])
    end
  end

  def [](pos)
    x, y = pos
    @grid[x][y]
  end

  def []=(from_pos, piece)
    x, y = from_pos
    @grid[x][y] = piece
  end

  def length
    @grid.length
  end

  def dup
    new_board = Board.new(true)
    new_board.place_null_pieces

    (0..7).each do |i|
      (0..7).each do |j|
        piece = self[[i, j]]
        p piece.class.to_s
        case piece.class.to_s

        when "King"
          new_board[[i, j]] = King.new(new_board, piece.team, [i, j])
        when "Queen"
          new_board[[i, j]] = Queen.new(new_board, piece.team, [i, j])
        when "Bishop"
          new_board[[i, j]] = Bishop.new(new_board, piece.team, [i, j])
        when "Knight"
          new_board[[i, j]] = Knight.new(new_board, piece.team, [i, j])
        when "Rook"
          new_board[[i, j]] = Rook.new(new_board, piece.team, [i, j])
        when "Pawn"
          new_board[[i, j]] = Pawn.new(new_board, piece.team, [i, j])
        else
          next
        end
      end
    end
    new_board
  end

  def switch_players
    @current_player = @current_player == @player_colors[0] ? @player_colors[1] : @player_colors[0]
  end

  def move_piece!(from_pos, to_pos)
    check_for_blank_square(from_pos)
    check_for_valid_move(from_pos, to_pos)

    self[from_pos].to_position(to_pos)
    self[from_pos], self[to_pos] = NullPiece.instance, self[from_pos]
  end

  def check_for_blank_square(from_pos)
    if self[from_pos].class == NullPiece
      raise ArgumentError.new "There is no piece here."
    end
  end

  def check_for_valid_move(from_pos, to_pos)
    new_board = self.dup
    possible_moves = new_board[from_pos].valid_moves
    unless possible_moves.include?(to_pos)
      raise ArgumentError.new "That is not a valid move"
    end
  end

  def in_check?(color)
    king_pos = find_king(color)
    opponent_team = (@player_colors - [color]).first
    opponent_pieces = all_player_pieces(opponent_team)


    opponent_moves = []
    opponent_pieces.each do |piece|
      opponent_moves += piece.valid_moves
    end

    opponent_moves.include?(king_pos)
  end

  def checkmate?(color)
    friendly_pieces = all_player_pieces(color)

    friendly_pieces.all? { |piece| piece.valid_moves.empty? }
  end

  def all_player_pieces(color)
    pieces = []
    (0..7).each do |i|
      (0..7).each do |j|
        piece = self[[i, j]]
        pieces << piece if piece.team == color
      end
    end
    pieces
  end

  def same_team?(pos1, pos2)
    self[pos1].same_team?(self[pos2])
  end

  def find_king(color)
    (0..7).each do |i|
      (0..7).each do |j|
        piece = self[[i, j]]
        return [i, j] if piece.class == King && piece.team == color
      end
    end
  end

  def in_bounds?(pos)
    pos.all? { |coord| coord.between?(0, @grid.length - 1) }
  end

  def blank?(pos)
    self[pos] == NullPiece.instance
  end
end
