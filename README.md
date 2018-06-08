# command-line-chess

Chess is a Ruby program played on the command line. It's a two player game where players have the option to start a new game or continue a saved previous match.

## Getting Started
These instructions will get you a copy of the project up and running on your local machine. 

### Prerequisites
To work with ruby programs you will need to install <a href="https://www.ruby-lang.org/en/documentation/installation/">Ruby</a>. 

### Installing
1. On GitHub, click on the <b>clone or download</b> button and copy the URL.
2. Open your command prompt /terminal.
3. Change your current working directory to the location you want to save your project in.
4. Type git clone and paster the URL you copied earlier:

```
$ git clone https://github.com/tfb34/battleship.git
```

5. Press Enter. You should now have a copy of the project on your computer.

## How to Play

To start the game, you must run the program in terminal :

```
$ ruby main.rb
```
<p>Two players are needed to play. The program will ask users to enter 1 or 2 if they wish to start a new game(1) or continue game(2).To move a chess piece, player must find the column letter and row number of chess piece.<br/>Example:<br/>Let's say Jin wants to move his pawn at d2 to d4. He must type 'd2 d4' and then hit enter. The move is valid, therefore the next player can go.</p>
<a href="http://imgur.com/oN6kyJZ"><img src="http://i.imgur.com/oN6kyJZ.png" title="source: imgur.com" /></a>
<p>Otherwise, the player will be prompted for another move</p>
<b>End Game</b>
<ul>
<li>checkmate</li>
<li>player resigns</li>
<li>save</li>
<li>draw; if there's a draw, flip a coin for now</li>
</ul>
<p>Two-Move Checkmate</p>
<a href="http://imgur.com/N1Y2Se9"><img src="http://i.imgur.com/N1Y2Se9.png" title="source: imgur.com" /></a>
<p>For player to resign, player must type resign , at his/her turn.</p><a href="http://imgur.com/a708isI"><img src="http://i.imgur.com/a708isI.png" title="source: imgur.com" /></a><br/>
<p>To save game, a player must type save , at his/her turn. A player may start from a loaded game, by entering (e.g. steins) when prompted, but has the option of overwriting current loaded game or saving a new file. </p>
<a href="http://imgur.com/yBf1eoL"><img src="http://i.imgur.com/yBf1eoL.png" title="source: imgur.com" /></a>
<h3>Chess Refresher</h3>
<p>
Rook(a1) : moves horizontally and vertically any number of unoccupied squares. *<br/>
Knight(b1) : moves in an L shape in any direction. From b1, the knight has only 2 locations it can move to, a3 or c3.<br/>
Bishop(c1) : moves diagonally any number of unoccupied squares in any direction. *<br/>
Queen(d1) : moves horizontally, vertically, and diagonally for any number of unoccupied squares in any direction.*<br/>
King(e1) : moves to an adjacent square in any direction. At the moment, castling is not an option. *<br/>
row 2<br/>
Pawn(c2) : moves forward 1 square at a time. May move diagonally 1 square, only if it's capturing an enemy. Cannot capture an opponent directly in front of it. Only on its initial move, may pawn move forward 2 squares. </p>
<i>* At the start of game, chess piece may not move anywhere because all possible paths are blocked by another chess piece.</i>

<h4>Illegal moves</h4>
<p>If a particular move exposes the king, or would put the king in check, then the program will prompt you for another move.</p>
<h4>Promotion</h4>
<p>If a pawn makes it to the very opposite end of the board(row1 or row8), it will be promoted. The program will prompt user to enter queen, rook, bishop, or knight. The pawn on the board is then replaced with the player's choice. </p>

<p>For more information on chess visit <a href=https://en.wikipedia.org/wiki/Chess>wikipedia page</a></p>

## Tips
If you do not see the chess pieces as they appear in the pictures above, you may need to go to command prompt settings and change the font. On Windows, change the font to DejaVu Sans Mono.

## Built With

* [Ruby](https://www.ruby-lang.org/en/) - The programming language used
* [YAML](http://yaml.org/) - The data serialization language used to store saved games
