class Board
  attr_reader :board
  def initialize
    @board = Array.new(3) { Array.new(3, ' ') }
  end
  def print_board
    puts "#{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]}"
    puts "========="
    puts "#{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]}"
    puts "========="
    puts "#{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]}"
  end
  def try_move?(move_target, id)
    row = move_target[0]
    col = move_target[1]
    if @board[row][col] == " "
      @board[row][col] = id
      return true
    else
      puts "That space is already occupied."
      print_board
      return false
    end
  end
end