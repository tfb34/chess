require_relative 'player.rb'

class Player2 < Player

    def initialize(username, board)
        @name = username
        @board = board
        @symbol = "\u25CB"
        @chess_pieces = {}#initiate, must add objects to this hash
        set_chess_pieces
    end

    def set_chess_pieces
    	@chess_pieces[[8,1]] = Rook.new("white",[8,1],@board)
         @board.enter_value(8,1,@chess_pieces[[8,1]])
    	@chess_pieces[[8,8]] = Rook.new("white",[8,8],@board)
         @board.enter_value(8,8,@chess_pieces[[8,8]])
    	@chess_pieces[[8,2]] = Knight.new("white",[8,2],@board)
         @board.enter_value(8,2,@chess_pieces[[8,2]])
    	@chess_pieces[[8,7]] = Knight.new("white",[8,7],@board)
         @board.enter_value(8,7,@chess_pieces[[8,7]])
    	@chess_pieces[[8,3]] = Bishop.new("white",[8,3],@board)
         @board.enter_value(8,3,@chess_pieces[[8,3]])
    	@chess_pieces[[8,6]] = Bishop.new("white",[8,6],@board)
         @board.enter_value(8,6,@chess_pieces[[8,6]])
    	@chess_pieces[[8,4]] = Queen.new("white",[8,4],@board)
         @board.enter_value(8,4,@chess_pieces[[8,4]])
    	@chess_pieces[[8,5]] = King.new("white",[8,5],@board)
         @board.enter_value(8,5,@chess_pieces[[8,5]])	

         @king_location = [8,5]
         
    	1.upto(8) do |col| 
    		@chess_pieces[[7,col]] = Pawn.new("white",[7,col],@board)
             @board.enter_value(7,col,@chess_pieces[[7,col]])
    	end
    end

end