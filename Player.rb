  class Player
    attr_accessor :move
    def initialize(id)
      @id = id
      @games_played = 0
      @wins = 0
      @winning_streak = 0
    end
    def validate_move_format?(row, col)
      # begin
      #   Integer(row)
      # rescue ArgumentError
      #   puts "#{row} is not a valid number. Try again."
      #   return false
      #   next
      # begin
      #   Integer(col)

      
    end
    def move
      valid_move_format = false
      until valid_move_format == true
        puts "Choose the row for your move: [0, 1, or 2]:"
        row = gets.chomp
        begin
          row_int = Integer(row)
        rescue ArgumentError
          puts "#{row} is not a valid number."
          next
        end
        unless row_int == 0 || row_int == 1 || row_int == 2
          puts "Invalid entry. Please select 0, 1, or 2"
          next
        end
        puts "Choose the column for your move: [0, 1, or 2]:"
        col = gets.chomp
        begin
          col_int = Integer(col)
        rescue ArgumentError
          puts "#{col} is not a valid number."
          next
        end
        unless col_int == 0 || col_int == 1 || col_int == 2
          puts "Invalid entry. Please select 0, 1, or 2"
          next
        end
        valid_move_format = true
      end
      return [row_int, col_int]
    end
  end