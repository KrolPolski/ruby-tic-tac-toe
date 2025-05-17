require_relative 'Board'
require_relative 'Player'
class Game
  attr_accessor :board
  def initialize
    @player_x = Player.new('x')
    @player_o = Player.new('o')
    @board = Board.new
    @rounds_played = 0
    @game_over = false
    @turn = 'X'
  end
  def new_game
    until @game_over == true
      @player_x.move
    end
  end
end

curr_game = Game.new
curr_game.board.print_board()
curr_game.new_game