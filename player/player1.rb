require_relative 'player.rb'

class Player1 < Player
    def initialize(username, board)
        @name = username
        @board = board
        @symbol = "\u25CF"
        @chess_pieces = {}#initiate, must add objects to this hash
        set_chess_pieces
    end

    def set_chess_pieces
    	@chess_pieces[[1,1]] = Rook.new("black",[1,1],@board)
         @board.enter_value(1,1,@chess_pieces[[1,1]])
    	@chess_pieces[[1,8]] = Rook.new("black",[1,8],@board)
         @board.enter_value(1,8,@chess_pieces[[1,8]])
    	@chess_pieces[[1,2]] = Knight.new("black",[1,2],@board)
         @board.enter_value(1,2,@chess_pieces[[1,2]])
    	@chess_pieces[[1,7]] = Knight.new("black",[1,7],@board)
         @board.enter_value(1,7,@chess_pieces[[1,7]])
    	@chess_pieces[[1,3]] = Bishop.new("black",[1,3],@board)
         @board.enter_value(1,3,@chess_pieces[[1,3]])
    	@chess_pieces[[1,6]] = Bishop.new("black",[1,6],@board)
         @board.enter_value(1,6,@chess_pieces[[1,6]])
    	@chess_pieces[[1,4]] = Queen.new("black",[1,4],@board)
         @board.enter_value(1,4,@chess_pieces[[1,4]])
    	@chess_pieces[[1,5]] = King.new("black",[1,5],@board)	
         @board.enter_value(1,5,@chess_pieces[[1,5]])
         #keep track of the king at all times
         @king_location = [1,5]
         
    	1.upto(8) do |col| 
    		@chess_pieces[[2,col]] = Pawn.new("black",[2,col],@board)
            @board.enter_value(2,col,@chess_pieces[[2,col]])
    	end
    end

end