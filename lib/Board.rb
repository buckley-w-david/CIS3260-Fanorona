####################################################################
# Class: Board_View
# Date Created: Nov. 2 2017
#
# Description:  The game baord and it's functions.
####################################################################

class Board

    ####################################################################
    # Method: initialize
    #
    # Description: - Initializes the board
    # A string position is when a piece can move diagonally from that position
    #
    ####################################################################
    def initialize()
        # Need to initialize board hash to starting game position
        # the 0,0 for the board is in the bottom left of the board.
        @board_hash = {
            #black pieces
            '0,4' => :Black,
            '1,4' => :Black,
            '2,4' => :Black,
            '3,4' => :Black,
            '4,4' => :Black,
            '5,4' => :Black,
            '6,4' => :Black,
            '7,4' => :Black,
            '8,4' => :Black,
            '0,3' => :Black,
            '1,3' => :Black,
            '2,3' => :Black,
            '3,3' => :Black,
            '4,3' => :Black,
            '5,3' => :Black,
            '6,3' => :Black,
            '7,3' => :Black,
            '8,3' => :Black,
            '0,2' => :Black,
            '2,2' => :Black,
            '5,2' => :Black,
            '7,2' => :Black,

            # white pieces
            '0,1' => :White,
            '1,1' => :White,
            '2,1' => :White,
            '3,1' => :White,
            '4,1' => :White,
            '5,1' => :White,
            '6,1' => :White,
            '7,1' => :White,
            '8,1' => :White,
            '0,0' => :White,
            '1,0' => :White,
            '2,0' => :White,
            '3,0' => :White,
            '4,0' => :White,
            '5,0' => :White,
            '6,0' => :White,
            '7,0' => :White,
            '8,0' => :White,
            '1,2' => :White,
            '3,2' => :White,
            '6,2' => :White,
            '8,2' => :White,
            
            # the empty middle space
            '4,2' => :Empty
            
        }


        # initialize Weak and strong positions List
        @weak = [
            '0,4',
            '0,2',
            '0,0',
            '1,3',
            '1,1',
            '2,4',
            '2,2',
            '2,0',
            '3,3',
            '3,1',
            '4,4',
            '4,2',
            '4,0',
            '5,3',
            '5,1',
            '6,4',
            '6,2',
            '6,0',
            '7,3',
            '7,1',
            '8,4',
            '8,2',
            '8,0'
        ]

        @strong = [
            '0,3',
            '0,1',
            '1,4',
            '1,2',
            '1,0',
            '2,3',
            '2,1',
            '3,4',
            '3,2',
            '3,0',
            '4,3',
            '0,3',
            '0,1',
            '1,4',
            '1,2',
            '1,0',
            '2,3',
            '2,1',
            '3,4',
            '3,2',
            '3,0',
            '4,3',
        ]

        @last_direction = nil
    end

    ####################################################################
    # Method: action
    #
    # Description: Checks if the attempted move is valid and if so
    #              ensures the move gets made.
    #
    # Arguments:   new_position    : A position that a piece is moving from. (int array [xPos,yPos]) 
    #              initial_position: A position that a piece is moving to.  (int array [xPos,yPos]) 
    #
    # Returns: - :A if the attempted move was an approching move
    #          - :W if the attempted move was a withdrawling move
    #          - :P if the attempted move was a paika move
    #          - :N if the attempted move was not valid move
    ####################################################################
    def action(new_position, initial_position)
        
    end

    ####################################################################
    # Method: count_opponent
    #
    # Description: Check if there are any pieces of colour opponent_colour
    #              on the board.
    #
    # Arguments: - opponent_colour: A symbol of either :symbol_1 or :symbol_2
    #
    # Returns: True : If no pieces of opponent_colour are found on the board.
    #          Flase: Otherwise
    ####################################################################
    def count_opponent(opponent_colour)
    end


    ####################################################################
    # Method: validate
    #
    # Description: Determines if a move from the iniital_postion to 
    #              the new_positon is valid.
    # 
    #
    # Arguments:   new_position    : Position a piece is moving to.     (int array [xPos,yPos]) 
    #              initial_position: Position a piece is moving from to (int array [xPos,yPos]) 
    #
    # Returns:     True :  If a valid move is requsted
    #              False:  Otherwise
    ####################################################################
    def validate(new_position, initial_position)

        # Calls theses functions to validate the requested move:
        # validate_piece()
        # validate_neighbours()
        # validate_direction() 
        return false;
    end

    ####################################################################
    # Method: validate_piece    
    #
    # Description: Returns if the position selected holds a valid piece
    # 
    #
    # Arguments:   initial_position    : The position to validate     (int array [xPos,yPos]) 
    #
    # Returns:     True :  If the position selected holds a valid piece
    #              False:  Otherwise
    ####################################################################
    def validate_piece(initial_position)
    end

    ####################################################################
    # Method: validate_neighbors
    #
    # Description: Checks if the selected position is valid.
    #
    # Arguments:   new_position    : Position a piece is moving to.     (int array [xPos,yPos]) 
    #              initial_position: Position a piece is moving from to (int array [xPos,yPos]) 
    #
    # Returns: True : If the selected position is valid
    #          False: Otherwise
    ####################################################################
    def validate_neighbors(new_position, initial_position)
        
        # var = get_neighbours()
        # if newPosition is in var, move is valid
    end

    ####################################################################
    # Method: get_neighbors
    #
    # Description: Based on strength  returns a list of all possible locations to move
    #
    # Arguments: initial_position: Position a piece 
    #
    # Returns: List[][2] the list of moves that are valid
    ####################################################################
    def get_neighbors(initial_position)

    end

    ####################################################################
    # Method: validate_direction
    #
    # Description: Returns if a piece can move in that direction since a piece cannot move in the same direction twice
    #
    # Arguments: new_position: New Position a piece 
    # Arguments: initial_position: Old Position a piece 
    #
    # Returns: If it was a valid direction
    ####################################################################
    def validate_direction(new_position, initial_position)
        #calls find_direction()
    end

    ####################################################################
    # Method: find_direction
    #
    # Description: Determines a direction from the given positions
    #
    # Arguments: new_position: New Position a piece 
    # Arguments: initial_position: Old Position a piece 
    #
    # Returns: Symbol() either N,S,E,W,NE,SE,SW,NW
    ####################################################################
    def find_direction(new_position, initial_postion)

    end

    ####################################################################
    # Method: move_type
    #
    # Description: returns a symbol associate with the move type of the move the player made
    #
    # Arguments: new_position: New Position a piece 
    # Arguments: initial_position: Old Position a piece 
    #
    # Returns: Symbol A,W,P,N
    ####################################################################
    def move_type(new_position, initial_position)
        
    end

    ####################################################################
    # Method: is_approach
    #
    # Description: determines is a move is a withdrawf
    #
    # Arguments: new_position: New Position a piece 
    # spec only has one param
    #
    # Returns: Symbol A,W,P,N
    ####################################################################
    def is_approach(new_position, initial_position)
        
    end
    ####################################################################
    # Method: is_withdraw
    #
    # Description: determines if a move is a withdraw
    #
    # Arguments: new_position: New Position a piece 
    #
    # Returns: Bool
    ####################################################################
    def is_withdraw(new_position, iniital_postion)
        
    end
                        
    ####################################################################
    # Method: capture_avaliable
    #
    # Description: Looks at the board_hash and checks if there are any approach moves available
    #
    #
    # Returns:     True :  If an approach move is available
    #              False:  Otherwise
    ####################################################################
    def capture_avaliable()
        
    end
    ####################################################################
    # Method: update_board
    #
    # Description: Updates the board hash with the affected pieces given
    #
    # Arguments: affected_pieces: a list of affected pieces List[][3]
    #
    # Returns:     Void
    ####################################################################
    def update_board(affected_pieces)
        
    end

    ####################################################################
    # Method: set_last_direction
    #
    # Description: Updates the last direction if it changed
    #
    #
    # Returns:     True :  If the direction changed
    #              False:  Otherwise
    ####################################################################
    def set_last_direction(new_position, initial_position)
        
    end
end

testBoard = Board.new
p testBoard.action(['-','-'],[])