require_relative './piece.rb'
require_relative './helper_tools.rb'

class King < Piece

#castling not available
 	def initialize(color, location, board)
		if color == BLACK
			@coat = "\u265A"

		else
			@coat = "\u2654"
		end
		@color = color
		@location = location
		@board = board
	end
   #king may move to 1 adjacent square. If player's 'to' or value, for king does not meet requirements, return false
    def clear_path?(value)
    	row = value[0]
    	col = value[1]

    	value = false
    	case row
    	when get_x-1
    		value = true if col==get_y-1 || col==get_y || col==get_y+1
    	when get_x
    		value = true if col==get_y-1 || col==get_y+1
        when get_x+1
        	value = true if col==get_y-1 || col==get_y || col==get_y+1
        else
        	return false
        end
        value
    end

    def escape_threat?(player,board,threat_loc)
        #puts "inside escape_threat"
        return true if clear_path?(threat_loc) && !exposes_king?(player,board,@location, threat_loc) #king can eliminate threat
        #king can move out of danger
        #puts "king cannot eliminate threat"
        (get_x-1).upto(get_x+1) do |r|
            if r>0 && r<9
                (get_y-1).upto(get_y+1) do |c|
                    if c>0 && c<9
                        #puts "what if we move king to: #{[r,c]}"
                        return true if (board.empty?(r,c) || player.opponent.has_piece?([r,c])) && !exposes_king?(player,board,@location, [r,c])
                        #puts "-------space is not empty or has ally or king is unsafe"
                    end
                end
            end
        end
        #puts "escape_threat: false"
        false
    end

end

