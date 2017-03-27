require_relative './piece.rb'

class Knight < Piece
	def initialize(color, location, board)
		if color == BLACK
			@coat = "\u265E"

		else
			@coat = "\u2658"
		end
		@color = color
		@location = location
		@board = board
	end

    #unlike, the other clear_path? functions, this one doesn't check if path is obstructed
    # it checks if the position is valid(knights travel in L shapes)
	def clear_path?(record_route = false, position)
		row = position[0]
		col = position[1]
	   
		value = false
		case row
		when get_x-2
			value = true if col == (get_y-1) || col == (get_y+1)
		when get_x-1
			value = true if col == (get_y-2) || col == (get_y+2)
		when get_x+1
			value = true if col == (get_y-2) || col == (get_y+2)
	    when get_x+2
	    	value = true if col == (get_y-1) || col == (get_y+1)
	    else
	    	return false
	    end
	    value 
	end

end