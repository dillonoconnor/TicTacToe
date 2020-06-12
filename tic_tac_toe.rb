class Board
  attr_accessor :state, :change_state
  @@state = Array(1..9)
  def self.state
    @@state
  end
  def self.show_state 
    puts "[ #{self.state[0]} ][ #{self.state[1]} ][ #{self.state[2]} ]"
    puts "[ #{self.state[3]} ][ #{self.state[4]} ][ #{self.state[5]} ]"
    puts "[ #{self.state[6]} ][ #{self.state[7]} ][ #{self.state[8]} ]"
  end
  def self.change_state(loc,mark)
    @@state[loc-1] = mark
  end
  def self.winning_combos
    @@state[0..2] == ['X']*3 || @@state[0..2] == ['O']*3 ||
    @@state[3..5] == ['X']*3 || @@state[3..5] == ['O']*3 ||
    @@state[6..8] == ['X']*3 || @@state[6..8] == ['O']*3 ||
    @@state.values_at(0,4,8) == ['X']*3 || @@state.values_at(0,4,8) == ['O']*3 ||
    @@state.values_at(2,4,6) == ['X']*3 || @@state.values_at(2,4,6) == ['O']*3 ||
    @@state.values_at(0,3,6) == ['X']*3 || @@state.values_at(0,3,6) == ['O']*3 ||
    @@state.values_at(1,4,7) == ['X']*3 || @@state.values_at(1,4,7) == ['O']*3 ||
    @@state.values_at(2,5,8) == ['X']*3 || @@state.values_at(2,5,8) == ['O']*3
  end
end

class Player
  attr_accessor :mark
  def initialize(mark)
    @mark = mark
  end
end

turn = 0
played_spaces = []
player_one = Player.new('X')
player_two = Player.new('O')


puts Board.show_state
puts "Let's play a game."
until Board.winning_combos
  if turn.even?
    oneloc = 0
    until (1..9).include?(oneloc) && !played_spaces.include?(oneloc)
      puts "Player One--what's your move? (1-9)"
      oneloc = gets.chomp!.to_i
    end
    played_spaces.push(oneloc)
    Board.change_state(oneloc,player_one.mark)
  else
    twoloc = 0
    until (1..9).include?(twoloc) && !played_spaces.include?(twoloc)
      puts "Player Two--what's your move? (1-9)"
      twoloc = gets.chomp!.to_i
    end
    played_spaces.push(twoloc)
    Board.change_state(twoloc,player_two.mark)
  end
  puts Board.show_state
  turn += 1
  if Board.winning_combos
    if (turn - 1).even?
      puts "Player one (#{player_one.mark}) wins!"
    else
      puts "Player two (#{player_two.mark}) wins!"
    end
  end
end