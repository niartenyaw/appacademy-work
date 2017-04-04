module SlidingPiece
  def moves
    available_dirs = []

    available_dirs += horizontal_dirs if move_dirs.include?(:vert)
    available_dirs += diagonal_dirs if move_dirs.include?(:diag)
    p available_dirs
    available_moves = []
    available_dirs.each do |dir|
      available_moves += grow_unblocked_moves_in_dir(dir)
    end
    p available_moves
    available_moves
  end

  private

  def horizontal_dirs
    [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1]
    ]
  end

  def diagonal_dirs
    [
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ]
  end

  def grow_unblocked_moves_in_dir(dir)
    possible_moves = []
    new_position = @position
    while true
      new_position = new_position.zip(dir).map { |x, y| x + y }
      return possible_moves unless @board.in_bounds?(new_position)
      if @board[new_position].nil?
        possible_moves << new_position
      else
        possible_moves << new_position unless @board[new_position].team == @team
        return possible_moves
      end
    end
  end
end
