class Pawn < Piece

  def initialize(board, team, position = nil)
    super(board, team, position)
  end

  def symbol
    "P"
  end

  def moves
    available_moves = []
    available_moves += forward_steps
    available_moves += side_attacks
    available_moves
  end

  protected

  def at_start_row?
    if @team == :cyan
      @position[0] == 6
    else
      @position[0] == 1
    end
  end

  def forward_dir
    @team == :cyan ? -1 : 1
  end

  def forward_steps
    steps = []
    forward = [@position[0] + forward_dir, @position[1]]

    if @board.blank?(forward)
      steps << forward
      forward_two = [forward[0] + forward_dir, @position[1]]
      if at_start_row? && @board.blank?(forward_two)
        steps << forward_two
      end
    end

    steps
  end

  def side_attacks
    attacks = []
    forward = @position[0] + forward_dir
    [-1, 1].each do |j|
      pos = [forward, @position[1] + j]
      next unless @board.in_bounds?(pos)
      attacks << pos unless @board.same_team?(@position, pos) || @board[pos] == NullPiece.instance
    end
    attacks
  end
end
