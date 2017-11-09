####################################################################
# Class: Board_View
# Date Created: Oct. 31 2017
#
# Description:  Interface that visulizes the Board for the user.
####################################################################

class Board_View


    ####################################################################
    # Method: initialize
    #
    # Description: - Initializes the board_view
    # 
    # Arguments:   - newBoard: A reference to an instance of the Board class
    #
    ####################################################################
    def initialize(newBoard)
        @current_board = newBoard
    end

    ####################################################################
    # Method: update
    #
    # Description: Prints the current state of the model to the screen.
    #
    ####################################################################
    def update()
        # Loops through each corrdinate of the board and asks it what
        # piece colour it has on it. print the piece colour to the screen.

        # A line connecting two spaces. This gets printed after a '|' in rows
        # that contain only these connecting lines (rows that cannot contain pieces)
        connection = "\\"

        # Board size is 9x5
        for i in (8).downto(0) do
            # If i is even, print number, and the pieces on the board.
            # Else: print a row of connecting lines
            if (i%2 == 0)
                # Print the number
                print ("#{i/2} ")

                # Print the pieces on the board
                for j in 0..8 do
                    
                    piece = current_board.board_hash("#{j},#{(i/2)}") 
                    if (piece == :black)
                            print "x"
                    elsif (piece == :white)
                        print "o"
                    else
                        print "+"
                    end
                     
                    if (j != 8)
                        print "-"
                    end
                end
                print "\n"

            # print the connecting lines
            else
                print "  "
                for j in 0..8 do
                    # Toggle the diagonal connecting lines.
                    # these lines do no toggle the final
                    # time that the are printed in a row.
                    if (j < 7)
                        if (connection == "\\")
                            connection = "/"
                        else
                            connection = "\\"
                        end
                    end

                    # print a pair of connecting lines.
                    # Rows do not end with a diagnol
                    # connecting line. Print only 
                    # a "|" when that occurs
                    if (j != 8)
                        print "|#{connection}"
                    else
                        print "|"
                    end
                end
                print "\n"
            end
        end

        # Print the numbers column numbers at
        # the bottom of the board.
        print " "
        for i in 0..8
            print " #{i}"
        end
        print "\n"
    end
end
