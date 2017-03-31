require_relative '../treenode/lib/00_tree_node.rb'
require "byebug"
class KnightPathFinder

  attr_reader :root

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

  def initialize(start_pos = [0, 0])
    @start_pos = start_pos
    @visited_positions = [start_pos]
    @root = PolyTreeNode.new(start_pos)
  end

  def new_move_positions(pos)
    move_options = KnightPathFinder.valid_moves(pos)
    move_options.reject { |el| @visited_positions.include?(el) }
  end

  def build_move_tree
    moves_seen = []
    queue = []
    queue.push(@root)
    until queue.empty?
      #debugger
      current_node = queue.shift
      positions = new_move_positions(current_node.value)
      positions.each do |pos|
        unless moves_seen.include?(pos)
          new_node = PolyTreeNode.new(pos)
          new_node.parent = current_node
          queue << new_node
        end
      end
      moves_seen += positions
    end
  end

  def display(node)
    puts "#{node.value} : #{node.children.map(&:value)}"
    node.children.each {|n| display(n) }
  end

  def find_path

  end

end

kpf = KnightPathFinder.new
kpf.build_move_tree
kpf.display(kpf.root)
