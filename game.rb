require_relative 'board'
require_relative 'player'
class Game
  #attr_accessor :board
  def initialize
    @player_x = Player.new('x')
    @player_o = Player.new('o')
    @board = Board.new
    @rounds_played = 0
    @game_over = false
    @turn = 'X'
    @moves = 0
    @last_winner = ' '
  end

  def game_over?
    board = @board.board
    board.each do |row|
      if row[0] != ' ' && row[0] == row[1] && row[1] == row[2]
        # puts "Row winner detected"
        @last_winner = row[0]
        return true
      end
    end
    for i in 0..2 do
      if board[0][i] != ' ' && board[0][i] == board[1][i] && board[1][i] == board[2][i]
        @last_winner = board[0][i]
        # puts "column winner detected"
        return true
      end
    end
    if board[1][1] != ' ' && ((board[0][0] == board[1][1] && board[1][1] == board[2][2]) ||
      (board[0][2] == board[1][1] && board[1][1] == board[2][0]))
      @last_winner = board[1][1]
      # puts "diagonal winner detected"
      return true
    end
    if @moves == 9
      @last_winner = ' '
      return true
    end
    false
  end

  def new_game
    @game_over = false
    @board = Board.new
    @game_over = false
    @turn = 'X'
    @moves = 0
    until @game_over == true
      x_moved = false
      o_moved = false
      puts "It is currently #{@turn}'s turn.\n\n"
      until x_moved == true
        @board.print_board
        move_target = @player_x.move
        x_moved = @board.try_move?(move_target, 'X')
      end
      @turn = 'O'
      @moves += 1
      @game_over = game_over?
      if @game_over == true
        break
      end
      puts "It is currently #{@turn}'s turn.\n\n"
      until o_moved == true
         @board.print_board
         move_target = @player_o.move
        o_moved = @board.try_move?(move_target, 'O')
      end
      @turn = 'X'
      @moves += 1
      @game_over = game_over?
    end
    puts "\nThe game is over.\n\n"
    @board.print_board
    puts "\n"
    if @last_winner == ' '
      puts "Cat's game, it is a tie."
    else
      puts "The winner is #{@last_winner}"
    end
    @rounds_played += 1
    puts "You have played #{@rounds_played} rounds so far.\n\n"
    puts "Would you like to play again? [Y/N]"
    response = gets.chomp
    if %w[y yes].include?(response.downcase)
      new_game
    else
      puts "Bye now, thanks for playing"
    end
  end
end

curr_game = Game.new
curr_game.new_game