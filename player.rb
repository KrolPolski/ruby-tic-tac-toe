  class Player
    def initialize(id)
      @id = id
    end
    def move
      valid_move_format = false
      until valid_move_format == true
        puts "\nChoose the row for your move: [0, 1, or 2]:"
        row = gets.chomp
        begin
          row_int = Integer(row)
        rescue ArgumentError
          puts "#{row} is not a valid number."
          next
        end
        unless [0, 1, 2].include?(row_int) #unless row_int == 0 || row_int == 1 || row_int == 2
          puts 'Invalid entry. Please select 0, 1, or 2'
          next
        end
        puts 'Choose the column for your move: [0, 1, or 2]:'
        col = gets.chomp
        begin
          col_int = Integer(col)
        rescue ArgumentError
          puts "#{col} is not a valid number."
          next
        end
        unless [0, 1, 2].include?(col_int) #_int == 0 || col_int == 1 || col_int == 2
          puts 'Invalid entry. Please select 0, 1, or 2'
          next
        end
        valid_move_format = true
      end
      [row_int, col_int]
    end
  end
