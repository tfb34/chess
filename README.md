# chess
<h3>Run game </h3>
<p>Download project.<br/>Open terminal.<br/>Change the current working directory to the folder that contains 'chess'<br/>Run this line in terminal: </p>

      ruby main.rb
      
<h3>How to Play</h3>
<p>Two players are needed to play. The program will ask users to enter 1 or 2 if they wish to start a new game(1) or continue game(2).To move a chess piece, player must find the column letter and row number of chess piece.<br/>Example:<br/>Let's say Jin wants to move his pawn at d2 to d4. He must type 'd2 d4' and then hit enter. The move is valid, therefore the next player can go.</p>
<a href="http://imgur.com/oN6kyJZ"><img src="http://i.imgur.com/oN6kyJZ.png" title="source: imgur.com" /></a>
<p>Otherwise, the player will be prompted for another move<br/>End of Game:</p>
<ul>
<li>checkmate</li>
<li>player resigns</li>
<li>save</li>
<li>draw; if there's a draw, flip a coin for now</li>
</ul>
<p>For player to resign, player must type resign , at his/her turn.</p><a href="http://imgur.com/a708isI"><img src="http://i.imgur.com/a708isI.png" title="source: imgur.com" /></a><br/>
<p>To save game, a player must type save , at his/her turn. A player may start from a loaded game, by entering (e.g. jojo) when prompted, but has the option of overwriting current loaded game or saving a new file. </p>

<h3>Chess Refresher</h3>
<p>
* At the start of game, piece may not move anywhere because all possible paths are blocked by another chess piece.<br/>
Take a look at the chess pieces in row 1<br/>
Rook(a1) : moves horizontally and vertically any number of unoccupied squares. *<br/>
Knight(b1) : moves in an L shape in any direction. From b1, the knight has only 2 locations it can move to, a3 or c3.<br/>
Bishop(c1) : moves diagonally any number of unoccupied squares in any direction. *<br/>
Queen(d1) : moves horizontally, vertically, and diagonally for any number of unoccupied squares in any direction.*<br/>
King(e1) : moves to an adjacent square in any direction. *<br/>
row 2<br/>
Pawn(c2) : moves forward 1 square at a time. May move diagonally 1 square, only if it's capturing an enemy. Cannot capture an opponent directly in front of it. Only on its initial move, may pawn move forward 2 squares. </p>
<h4>Illegal moves</h4>
<p>If a particular move exposes the king, or would put the king in check, then the program will prompt you for another move.</p>
<h4>Promotion</h4>
<p>If a pawn makes it to the very opposite end of the board(row1 or row8), it will be promoted. The program will prompt user to enter queen, rook, bishop, or knight. The pawn on the board is then replaced with the player's choice. </p>

