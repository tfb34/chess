require_relative './square.rb'
class Board
  attr_accessor :hash, :latest_move, :board
#change hash to letter_bank
   def initialize
   	@board = Array.new(10) { Array.new(10)  }
   	@hash = {} #for letter conversion
   	setup 
   	setup_keys
   end
   
   def setup_keys
   	 key = 'a'
   	 1.upto(8) do |col|
   	 	@hash[key] = col
   	 	key = key.next
   	 end
   end

   def setup
   	 letter = 'a'
   	 for col in 1..8
   	 	@board[0][col] = letter
   	 	@board[9][col] = letter
   	 	letter = letter.next
   	 end
    
   	 for row in 1..8
   	 	@board[row][0] = row
   	 	@board[row][9] = row
   	 end
     color = ["\u25A0","\u25A1"]
     n = 0
     x = 0
   	 for row in 1..8
   	 	for col in 1..8
   	 		@board[row][col] = Square.new(row,col,color[n])
   	 		n == 0 ? (n = 1) : (n = 0)
   	 	end
        x == 0 ? (x = 1 && n = 1 ) : (x = 0 && n = 0)
   	 end
   end
   #takes a string "e6" and returns array "rowCol"
   def convert(loc)
     row = loc[1].to_i
     col = @hash[loc[0]]
     return [row,col]
   end

   def display
   	 print " "+@board[0].join(" ")+"\n"
     1.upto(8) do |row|
     	print @board[row].join(" ")+"\n"
     end
     print " "+@board[9].join(" ")+"\n"
   end

   def empty?(row,col)
   	  col = @hash[col] if col.is_a? String
   	 @board[row][col].empty?
   end
   
  def get(row,col)
      col = @hash[col] if col.is_a? String
      @board[row][col].chess_piece
  end
   #enters value in given location
   def enter_value(row,col,value)
      col = @hash[col] if col.is_a? String#interpret 'a' to mean 1
      @board[row][col].chess_piece = value
   end
   
   #takes two arrays(ex. [row_int,col_int])
   def move_value(from,to)
      #add that piece to location 'to'
      @board[to.first][to.last].chess_piece = get(from.first,from.last)
      #remove piece in location 'from'
      @board[from.first][from.last].chess_piece = nil
   end
end