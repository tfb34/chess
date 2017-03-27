class Square
	attr_accessor :chess_piece
	attr_reader :location, :color
     # Black square: "\u25A0", White square: "\u25A1"    
    def initialize(x,y,color)
    	@location = [x,y]
    	@color = color
    end

    def get_x
    	@location[0]
    end
   
    def get_y
    	@location[1]
    end
    
    #empty is private
    def empty?
    	return true if @chess_piece.nil?
    	false
    end

    def to_s
    	if empty?
    		@color
    	else
    		@chess_piece.coat
    	end
    end
    
end