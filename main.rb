
require_relative './player/chess_pieces/helper_tools.rb'
require_relative './player/player1.rb'
require_relative './player/player2.rb'
require './game_data.rb'
require './save_tools.rb'
require "yaml"

puts "Let's Play Chess!\n  Enter 1 : New Game\n  Enter 2 : Load Game"
input = get_valid_response(gets.chomp)
# if loading game
if input == "2"
    new_game = false
    file = get_filename
    puts "file : #{file}"
    if file.nil?
        input = "1"
        
    else
        #load game
        game_data = load_game(file)
        chess_board = game_data.last_board
        #get latest player
        x = game_data.last_x
        if x == 0
            player = [game_data.last_player , game_data.last_player.opponent]
        else
            player = [game_data.last_player.opponent , game_data.last_player]
        end
        puts game_data
    end
end
#starting new game
if input == "1"
    new_game = true
    chess_board = Board.new
    print "Enter player 1's name: "
    player1 = Player1.new(gets.chomp,chess_board)
    print "Enter player 2's name: "
    player2 = Player2.new(gets.chomp,chess_board)

    player1.set_opponent(player2)
    player2.set_opponent(player1)
    player = [player1,player2]
    #in case player wants to save later, we need to keep records of changes
    game_data = Game_Data.new

    x = 0
end
#exits if player resigns, saves, or there's a checkmate
while(true)
	chess_board.display
    
    if player[x].in_check? && player[x].checkmate?
        puts "CHECKMATE!\n#{player[x].opponent.name} Wins!"
        exit
    end

	player[x].send_message #ask player to give coordinates (e.g f1 f2)

    input = gets.chomp.downcase # ie. "e4" ->e represents column and 4, row
    
    if input.split.length ==2 && input =~ /\b[a-h]{1}[1-8]{1}\s[a-h]{1}[1-8]{1}\b/ #checks valid form and in bounds
      	# 'from' is location of chosen chess piece; 'to' is the location player wants to move piece to
      	from = chess_board.convert(input.split.first)#returns [row_num, col_num]
        to = chess_board.convert(input.split.last) #returns [row_num, col_num]
        
        # checking if 'from' and 'to' inputs are valid. 
        if player[x].has_piece?(from) && (player[x].opponent.has_piece?(to) || chess_board.empty?(to[0],to[1]))
           
            chess_piece = player[x].get_piece(from)
            
            if chess_piece.clear_path?(to)
                if !exposes_king?(player[x],chess_board,from,to)
                     #puts "does not expose king. moving piece..."
                    player[x].move_piece(from,to) #get piece, delete pick, update position
                    chess_board.latest_move = to
                    player[x].opponent.delete_piece(to) if player[x].opponent.has_piece?(to)
                    #check for pawn promotion
                    chess_piece.check_promotion(player[x]) if chess_piece.is_a? Pawn
            
                    #record session
                    game_data.add_session(chess_board, player[x].name, player[x].symbol, input)

                    x==0? x=1 : x=0 #next player's turn
        
                else
                 puts "Illegal move. Exposes king"
                end
            else
            	puts "Invalid move."
            end
        else
        	puts "Invalid move."
        end
    elsif input.include? "resign"
        puts "\n#{player[x].opponent.name} wins!"
        exit
    elsif input.include? "save"
        game_data.last_board = chess_board
        game_data.last_player = player[x]
        game_data.last_x = x
        
        serialized_object = YAML::dump(game_data)

        if new_game
            save_as(serialized_object)
        else
            save(file,serialized_object)
        end
        exit
    end
end
