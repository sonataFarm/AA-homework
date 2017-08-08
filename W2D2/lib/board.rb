require 'pry'
require 'byebug'

class Board
  CUPS = 12
  STORES = 2
  STORE_LOCATIONS = [6, 13]
  STONE = :stone
  INITIAL_STONES = 4

  attr_accessor :cups

  def initialize(name1, name2)
    initialize_cups
    initialize_players(name1, name2)
    place_stones
  end

  def make_move(start_pos, current_player_name)
    stones = take_stones(start_pos)

    end_pos = move_stones(stones, start_pos, current_player_name)
    render
    next_turn(end_pos, current_player_name)
  end

  def move_stones(stones, start_pos, current_player)
    # go around the board placing stones in each valid position until stones is empty.
    # a position is valid if it is either a valid cup or the player's store
    # return position of last stone placed
    pos = start_pos
    until stones.empty?
      pos = next_valid_pos(pos, current_player)
      cups[pos] << stones.shift
    end

    pos
  end


  def next_valid_pos(pos, current_player)
    loop do
      pos += 1
      pos %= CUPS + STORES
      break unless other_players_store?(pos, current_player)
    end
    pos
  end

  def other_players_store?(pos, player_name)
    if player_name == @player1_name
      pos == STORE_LOCATIONS.last
    else # else player2
      pos == STORE_LOCATIONS.first
    end
  end

  def current_players_store_pos(current_player)
    if current_player == @player1_name
      STORE_LOCATIONS.first
    else
      STORE_LOCATIONS.last
    end
  end

  def initialize_cups
    @cups = Array.new(CUPS + STORES) { [] }
  end

  def initialize_players(name1, name2)
    @player1_name = name1
    @player2_name = name2
  end

  def place_stones
    cups.each_with_index do |cup, idx|
      INITIAL_STONES.times do
        cup << STONE unless store_location?(idx)
      end
    end
  end

  def valid_move?(start_pos)
    unless valid_start_pos?(start_pos) && !empty?(start_pos)
      raise 'Invalid starting cup'
    end
  end

  def take_stones(pos)
    stones = []
    until cups[pos].empty?
      stones << cups[pos].shift
    end

    stones
  end

  def empty?(pos)
    cups[pos].empty?
  end

  def valid_start_pos?(start_pos)
    lo = 0
    hi = CUPS + STORES - 2
    (lo..hi).cover?(start_pos) && !STORE_LOCATIONS.include?(start_pos)
  end

  def store_location?(pos)
    STORE_LOCATIONS.include?(pos)
  end

  def next_turn(ending_cup_idx, current_player_name)
    # helper method to determine what #make_move returns
    if ending_cup_idx == current_players_store_pos(current_player_name)
      :prompt
    elsif cups[ending_cup_idx].count == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    bottom_side = cups[0...STORE_LOCATIONS[0]]
    top_side = cups[(STORE_LOCATIONS[0] + 1)...STORE_LOCATIONS[1]]

    [bottom_side, top_side].any? do |side|
      side_empty?(side)
    end
  end

  def side_empty?(side)
    side.all?(&:empty?)
  end

  def winner
    player1_score = tally(1)
    player2_score = tally(2)

    if player1_score > player2_score
      @player1_name
    elsif player2_score > player1_score
      @player2_name
    else
      :draw
    end
  end

  def tally(player_no)
    cups[STORE_LOCATIONS[player_no - 1]].count
  end
end
