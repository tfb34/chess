require './square.rb'
class Board
  attr_accessor :hash
   def initialize
   	@board = Array.new(10) { Array.new(10)  }
   	@hash = {}
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

   #enters value in given location
   def enter_value(row,col,value)
      col = @hash[col] if col.is_a? String#interpret 'a' to mean 1
      @board[row][col].chess_piece = value
   end
   
   #eliminates value's presence from given location
   def move_value(row,col)
   	   col = @hash[col]
   	   @board[row][col].chess_piece = nil
   end
end