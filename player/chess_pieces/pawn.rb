require_relative './piece.rb'
require_relative './rook.rb'
require_relative './knight.rb'
require_relative './queen.rb'
require_relative './bishop.rb'

class Pawn < Piece
   
	def initialize(color, location, board) 
		if color == BLACK
			@coat = "\u265F"

		else
			@coat = "\u2659"
		end
		@color = color
		@location = location
		@board = board
		@initial_move = true
	end

    
	def clear_path?(record_value=false, value) 
	 
	 row = value[0]
	 col = value[1]
     if @initial_move
     	return is_valid?(row,col)
     end

	 if @color == WHITE
         return false if row!=get_x-1 
     else#black piece moves to greater rows
         return false if row!=get_x+1 
     end
     #check if vertical or diagonal
     if @board.empty?(row,col)#vertical
	    return true if col == get_y
	 else
	 	return capture?(row,col) if col== get_y-1 || col==get_y+1
	 end
	 false 
	end
    
    def capture?(row,col)
    	chess_piece = @board.get(row,col)
    	return true if chess_piece.color==opponent_color
    	false
    end
    
    def check_promotion(player)
    	promote = false
    	if @color == BLACK
    		#puts "pawn is black and row is #{get_x}"
    		#checks if black pawn has made it to rank 8, if true : promote
            if get_x == 8
            	type = get_promotion_choice
            	new_piece = type.new("black",@location,@board)
            	#puts "created new #{new_piece.class}, #{new_piece.location.inspect}"
            	promote = true
            end
    	else
    		#checks if white pawn has made it to rank 1, if true : promote
    		if get_x == 1
    			type = get_promotion_choice
    			new_piece = type.new("white", @location, @board)
                promote = true
    		end
    	end

        if promote
           	@board.enter_value(get_x,get_y,new_piece)# updating chess board
           	player.enter_piece(@location, new_piece)# updating player's 'chess_pieces'
        end
    end

    def get_promotion_choice
        puts "You may promote your pawn to a queen, knight, rook, or bishop.\nType your choice and press Enter: "
   	    choice = gets.chomp.capitalize
    	while(choice !="Queen" && choice !="Knight" && choice !="Rook" && choice !="Bishop" )
    		choice = gets.chomp.capitalize
    	end    
    	Object.const_get(choice)
    end

	def is_valid?(row,col)
		bool = false
		if @color == WHITE
			return false if row!=get_x-1 && row!=get_x-2
		else
			return false if row!=get_x+1 && row!=get_x+2
		end
		if @board.empty?(row,col)#moves vertical on initial turn
			bool =true if col == get_y
		else#moves diagonal on initial turn
			if (row-get_x).abs == 1 && (col==get_y-1 || col==get_y+1)
                bool = true if capture?(row,col)
			end
		end
		@initial_move = false if bool
		return bool
	end
     

end