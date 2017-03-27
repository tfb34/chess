
require_relative './piece.rb'

class Bishop < Piece
	def initialize(color, location, board)
		if color == BLACK
			@coat = "\u265D"

		else
			@coat = "\u2657"
		end
		@color = color
		@location = location
		@board = board
	end
    #bishop may only move diagonally any number of unoccupied spaces
    def clear_path?(record_route = false,value)
        row = value[0]
        col = value[1]
       	diffRow = (row-get_x).abs
       	diffCol = (col-get_y).abs
        return diagonal_path_clear?(row,col) if diffRow == diffCol  #determines if proposed position is diagonal. if yes, check if path is clear
        return false
    end



end