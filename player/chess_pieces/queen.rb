require_relative './piece.rb'

class Queen < Piece

	def initialize(color, location, board) 
		if color == BLACK
			@coat = "\u265B"

		else
			@coat = "\u2655"
		end
		@color = color
		@location = location
		@board = board
	end
    
    #checks if the path between 'from' and 'to' is obstructed. 
    def clear_path?(record_route=false, value)
        row = value[0]
        col = value[1]
	    return vertical_path_clear?(record_route,row,col) if col == get_y#proposed position is in the same column
	    return horizontal_path_clear?(record_route,row,col) if row == get_x #proposed position is in the same row
       	diffRow = (row-get_x).abs
       	diffCol = (col-get_y).abs
       	return diagonal_path_clear?(record_route,row,col) if diffRow == diffCol#proposed position is diagonal
        false 
    end

end