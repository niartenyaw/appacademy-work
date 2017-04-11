require_relative 'player'

class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = Player.new(name1, 1)
    @player2 = Player.new(name2, 2)
    @cups = Array.new(14) {Array.new}
    place_stones
  end

  def place_stones
    @cups.each {|el| el << :stone << :stone << :stone << :stone }
    @cups[6] = []
    @cups[13] = []
  end

  def valid_move?(start_pos)
    raise ArgumentError.new "Invalid starting cup" unless start_pos.between?(1, 12)
  end

  def make_move(start_pos, current_player_name)
    stones = @cups[start_pos]
    @cups[start_pos] = []
    until stones.empty?
      start_pos = (start_pos + 1) % 14
      next if current_player_name == @player1.name && start_pos == 13
      next if current_player_name == @player2.name && start_pos == 6
      @cups[start_pos] << stones.pop
    end
    render
    next_turn(start_pos)
  end

  def next_turn(ending_cup_idx)
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    @cups[ending_cup_idx].length == 1 ? :switch : ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    player1_empty = @cups[0..5].all?(&:empty?)
    player2_empty = @cups[7..12].all?(&:empty?)
    player1_empty || player2_empty
  end

  def winner
    case @cups[13].count <=> @cups[6].count
    when -1
      return @player1.name
    when 0
      return :draw
    when 1
      return @player2.name
    end
  end
end
