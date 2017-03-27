
require_relative File.expand_path("../gameboard/board.rb",File.dirname(__FILE__))
 
class Piece
	attr_reader :location, :coat, :color, :route
	
	BLACK = "black"
	WHITE = "white"
    
	def get_x
    	@location[0]
    end

    def get_y
    	@location[1]
    end	
    
    def add_to_route(value)
        @route = [] if @route.nil?
        @route << value
    end

    def empty_route?
        return true if @route.nil? || @route.empty?
    end

    def delete_route
        @route = []
    end
    
    def set_location(location)
    	@location = location
    end
    
    def opponent_color
    	if @color == BLACK
    		return WHITE
    	else
    		return BLACK
    	end
    end
    
#the following 3 functions are called inside the 'clear_path?' function
#in the bishop, queen, rook class
    
    def vertical_path_clear?(record_route = false,row,col)
		return true if (row-get_x).abs == 1 
 		if get_x < row
 			(get_x+1).upto(row-1) do |x|
                add_to_route([x,col])
 			    if !@board.empty?(x,col)
                    delete_route
                    return false
                end
		    end
 		else
 			(get_x-1).downto(row+1) do |x|
                add_to_route([x,col])
 			    if !@board.empty?(x,col)
                    delete_route
                    return false
                end
 			end
 		end
        delete_route if !record_route
 		true
    end

    def horizontal_path_clear?(record_route=false,row,col)
		return true if (col-get_y).abs == 1
 	    if get_y <col
 			(get_y+1).upto(col-1) do |y|
                add_to_route([row,y])
 			   if !@board.empty?(row,y)
                    delete_route
                    return false
               end
 		    end
 		else
 			(get_y-1).downto(col+1) do |y|
                add_to_route([row,y])
 			   if !@board.empty?(row,y)
                  delete_route
                  return false
               end
 			end
 	    end
        delete_route if !record_route
 	    true
    end

    def diagonal_path_clear?(record_route=false,row,col)#Assumption: position row,col is located diagonally
 		return true if (row - get_x).abs == 1#adjacent
 		return check_right_side?(record_route,row,col) if col > get_y #right side
 		return check_left_side?(record_route,row,col) #otherwise, left side
    end

#the following functions are called within the 'diagonal_path_clear?' function only
private 

    def check_right_side?(record_route=false,row,col)
 		if row < get_x #upward #x-1, y+1
 			x = get_x-1
 			y = get_y+1
            while(x>row && y<col)
 		    	if !@board.empty?(x,y)
                    delete_route
                    return false
                end
                add_to_route([x,y])
 				x-=1 ; y+=1

 			end
 		else #downward ;  x+1, y+1
 			x = get_x+1
 			y = get_y+1
 			while(x<row && y<col)
 				if !@board.empty?(x,y)
                    delete_route
                    return false
                end
                add_to_route([x,y])
 				x+=1 ; y+=1
 			end
 		end
        delete_route if !record_route
        true
    end

    def check_left_side?(record_route=false,row,col)
 		if row <get_x #up
 			x = get_x-1
 			y = get_y-1
 			while(x>row && y >col)
				if !@board.empty?(x,y)
                    delete_route
                    return false
                end
                add_to_route([x,y])
 				x-=1 ; y-=1
 			end
 		else#down
 		    x = get_x+1
 			y = get_y-1
 			while(x<row && y>col)
 				if !@board.empty?(x,y)
                    delete_route
                    return false
                end
                add_to_route([x,y])
 				x+=1 ; y-=1
 			end
 		end
        delete_route if !record_route
 		true
    end

end