require("../lib/Player.rb")
require("../lib/Board.rb")
require("../lib/Board_View.rb")
require("../lib/Move.rb")

####################################################################
# File: fanarona.rb
# Date Created: Nov. 2 2017
#
# Description:  Entry point for the game Fanorona. Initializes classes
#               in the Lib folder and runs the game.
####################################################################
def flip(colour)
	if colour == :Black
		return :White
	else
		return :Black
	end
end

board = Board.new()
view = Board_View.new(board)

players = {
	:Black => Player.new(:Black, board),
	:White => Player.new(:White, board)
}

players[:White].set_name()
players[:Black].set_name()
turn = :White

loop do
	view.update()
	while ([:W, :A].include?(players[turn].do_move()))
		view.update()
	end
	
	
	turn = flip(turn)
	if board.count_opponent(turn)
		break
	end
end