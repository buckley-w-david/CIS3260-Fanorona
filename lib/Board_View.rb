####################################################################
# Class: Board_View
# Date Created: Oct. 31 2017
#
# Descirption:  Interface that visulizes Intersections for the user.
####################################################################

class Board_View


    ####################################################################
    # Method: initialize
    #
    # Descirption: - Initializes the board_view
    #
    ####################################################################
    def initialize(newBoard)
        @current_board = newBoard
    end

    ####################################################################
    # Method: update
    #
    # Descirption: Prints the current state of the model to the screen.
    #
    ####################################################################
    def update()
        # Loops through each corrdinate of the board and asks it what
        # piece colour it has on it. print the piece colour to the screen.

        conenction = "\\"
        # Board size is 9x5
        for i in 8..0 do
            # If i is even, print number, and the pieces on the board.
            # Else, print a row of conenecting lines
            if (i%2 == 0)
                puts ("#{i/2}")
                # Print the pieces on the board
                for j in 0..8 do
                    puts "-"
                    piece = current_board.board_hash("#{i,j}") 
                    if (piece == :black)
                        puts "x"
                    elsif (piece == :white)
                        puts "o"
                    else
                        puts "+"
                    end
                end

            else
                for j in 0..8 do
                    puts("|#{conenction}")
                    if (j != 8)
                        if (conenction == "\\")
                            conenction == "/"
                        else
                            conenction == "\\"
                        end
                    end
                end
            end
        end
    end
end
