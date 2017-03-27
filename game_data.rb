require_relative './player/gameboard/board.rb'

# the following is used only for serialization purposes

class Session
 attr_accessor :chess_board, :player_name, :player_symbol, :player_input
 def initialize(chess_board, p_name, symbol, input)
 	@board = copy(chess_board)
 	@player_name = p_name
 	@player_symbol = symbol 
 	@player_input = input
 end

 def to_s
    "#{@board.display}\n#{@player_name}'s turn #{player_symbol} : #{@player_input}"
 end

 def copy(chess_board)
 	b = Board.new 
    n = 0
    x = 0
   	 for row in 1..8
   	 	for col in 1..8
   	 		b.board[row][col] = chess_board.board[row][col].dup
   	 		n == 0 ? (n = 1) : (n = 0)
   	 	end
        x == 0 ? (x = 1 && n = 1 ) : (x = 0 && n = 0)
   	 end
   	 return b
 end

end

class Game_Data
	attr_accessor :last_board, :last_player, :last_x
	attr_reader :sessions_arr

	def initialize
		@sessions_arr = []
	end

	def add_session(board, player_name, symbol, input)#given board.dup
		session = Session.new(board,player_name,symbol,input)
		@sessions_arr << session
	end

	def to_s
      "#{@sessions_arr.each {|element| puts element};nil}"
	end
end

