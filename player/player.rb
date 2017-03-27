
require_relative './gameboard/board.rb'
require_relative './chess_pieces/rook.rb'
require_relative './chess_pieces/knight.rb'
require_relative './chess_pieces/bishop.rb'
require_relative './chess_pieces/queen.rb'
require_relative './chess_pieces/king.rb'
require_relative './chess_pieces/pawn.rb'

class Player

	attr_reader :name, :opponent, :symbol, :chess_pieces, :in_check, :threat_loc
    attr_accessor :king_location

    def send_message
        puts "In check!" if @in_check
        print "\n#{name}'s turn #{@symbol} : "
    end
    
    def checkmate? 
        #puts "inside checkmate"
        @chess_pieces.each do |key,piece|
            if !(piece.is_a? King) && piece.clear_path?(@threat_loc)#before it was @board.latest_move
                #puts "#{piece.location} : apparently there is a way of eliminating the piece at the latest_move"
                return false if !exposes_king?(self,@board,key, @board.latest_move)
            end #check if king can eliminate piece in latest_move without putting itself in check. do this last. after checking if allies can at least block if not elminate as above
        end
        #get route between threat to king using clear_path? 
         #puts "threat cannot be eliminated by peers"
        threat = @board.get(@threat_loc[0],@threat_loc[1])
        #threat piece now has filled its array
        #puts "threat: #{threat.class}"
        threat.delete_route
        threat.clear_path?(true,@king_location) 
        #puts "route from threat to king: #{threat.route.inspect}" 
        @chess_pieces.each do |key,piece|
          if !threat.empty_route?
                threat.route.each do |loc|
                   #puts "** piece : #{key}  route_space: #{loc}"
                   return false if piece.clear_path?(loc) && !exposes_king?(self,@board,key,loc)
                end
           end
        end
        #puts "Peers cannot save the king"
        #check if king can eliminate threat. must use exposes_king also
        king = get_piece(@king_location)
        return false if king.escape_threat?(self,@board, @threat_loc)
        true#gameover
    end

    def in_check?
        @opponent.chess_pieces.each do |key,piece|
             #puts "****NEW **Piece location: #{piece.location.inspect} clear_path? #{@king_location} = "
              if piece.clear_path?(@king_location)
                #puts "true"
                 @in_check = true
                 @threat_loc = piece.location
                 return true
              end
            #puts "false"
        end
        @threat_loc = nil
        @in_check = false
    end

    def set_opponent(x)
        @opponent = x
    end

    def has_piece?(loc)
    	
        @chess_pieces.has_key?(loc)
    end

   #Param: array, array
    def move_piece(from, to)
        #update chess piece
        piece = @chess_pieces[from] 
        piece.set_location(to)
        #update the player's record of the chess piece
        @chess_pieces.delete(from) 
        @chess_pieces[to] = piece 
        #updating board's record of the chess piece
        @board.move_value(from,to)

        if piece.is_a? King 
            @king_location = to
        end
    end
    
    #Param: array
    def delete_piece(loc) 
        @chess_pieces.delete(loc)
    end
    #Param: array, piece
    def enter_piece(loc,value)
        @chess_pieces[loc] = value
    end
    #Param: array
    def get_piece(loc)
        @chess_pieces[loc]
    end
end