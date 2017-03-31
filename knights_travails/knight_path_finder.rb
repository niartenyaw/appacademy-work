class KnightPathFinder

  def self.valid_moves(pos)
    # TODO return the list of 8 possible moves from curr_pos
    possible_moves = []
    [-2, 2].each do |large|
      [-1, 1].each do |small|
        large_x = [pos.first + large, pos.last + small]
        possible_moves << large_x if valid_pos?(large_x)

        large_y = [pos.first + small, pos.last + large]
        possible_moves << large_y if valid_pos?(large_y)
      end
    end
    possible_moves
  end

  def self.valid_pos?(pos)
    pos.all? { |i| i.between?(0, 7) }
  end

  def initialize(start_pos)
    @start_pos = start_pos
    @visited_positions = [start_pos]
  end

  def new_move_positions
    # TODO call valid moves, throwing out any visited_positions
    # return those positions
  end

  def build_move_tree

  end

  def find_path

  end

end
