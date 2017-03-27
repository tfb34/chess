#simulation. Moves piece and checks if king is threatened/exposed as a consequence
#if true, then player will be told that given move is invalid. Player will be prompted for another move
#if false, then move is valid 
def exposes_king?(player,chess_board,from, to)
   bool = false
  piece_from = chess_board.get(from.first, from.last)
  piece_to = chess_board.get(to.first,to.last)
                
    chess_board.move_value(from,to)#start simulation

    if piece_from.is_a? King
    	player.king_location = to
    end
    #checks if any opponent piece is threatening current player's king. 
    player.opponent.chess_pieces.each do |key,piece|
      clear = piece.clear_path?(player.king_location)
      #puts "Inside exposes_king: Piece location: #{piece.location.inspect} clear_path? #{player.king_location} = #{bool}"
      if key!=to && clear
        #puts "Exposes king! Illegal move"
        bool = true
        break
      end
    end
  # the following undoes simulation
   chess_board.move_value(to,from)
   chess_board.enter_value(to.first,to.last,piece_to)

   if piece_from.is_a? King
   		player.king_location = from
   end
    
   return bool
end


