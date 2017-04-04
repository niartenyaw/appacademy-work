module SteppingPiece

  def moves
    available_moves = []
    move_diffs.each do |move|
      available_moves << move.zip(@position).map { |x, y| x + y }
    end

    available_moves.select! { |move| @board.in_bounds?(move) }
    available_moves.reject { |move| @board.same_team?(move, @position) }
  end

end
