  
require_relative './piece.rb'

class Rook < Piece
  
  def initialize(color, location, board) 
    if color == BLACK
      @coat = "\u265C"
      
    else
      @coat = "\u2656"
    end
    @color = color
    @location = location
    @board = board
  end
   
  
  #assumes value or 'to' is valid(which means location 'to' has an opponent or it's empty)
  #checks if the path to 'to' is not obstructed
  def clear_path?(record_route=false,value)
	  row = value[0]
	  col = value[1]
    return vertical_path_clear?(record_route,row,col) if col == get_y#proposed position is in the same column
	  return horizontal_path_clear?(record_route,row,col) if row == get_x #proposed position is in the same row
    false 
  end


  
end