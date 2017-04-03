module SteppingPiece

  def moves
    available_moves = []
    move_diffs.each do |move|
      available_moves << move.zip(@position).map { |x, y| x + y }
    end

    available_moves.select! { |move| @board.in_bounds?(move) }
    available_moves.select! { |move| @board[move].nil? || @board[move].team != @team }
  end

end
