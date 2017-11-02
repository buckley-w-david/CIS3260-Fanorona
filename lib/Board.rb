####################################################################
# Class: Board_View
# Date Created: Nov. 2 2017
#
# Descirption:  The game baord and it's functions.
####################################################################

class Board


    ####################################################################
    # Method: initialize
    #
    # Descirption: - Initializes the board
    #
    ####################################################################
    def initialize()
        # Need to initialize board hash to starting game position
        @board_hash = Hash.new()

        # initialize Weak and strong positions List
        @weak       = Array.new(10) { }
        @strong     = Array.new(10) { }

        @last_direction = nil
    end

    ####################################################################
    # Method: action
    #
    # Descirption: Checks if the attempted move is valid and if so
    #              ensures the move gets made.
    #
    # Arguments:   new_position    : A position that a piece is moving from. (int array [xPos,yPos]) 
    #              initial_position: A position that a piece is moving to.  (int array [xPos,yPos]) 
    #
    # Returns: - :A if the attempted move was an approching move
    #          - :W if the attempted move was a withdrawling move
    #          - :P if the attempted move was a pakia move
    #          - :N if the attempted move was not valid move
    ####################################################################
    def action(new_position, initial_position)
          # Call @intersections methods to obtain a visulization of the game board
    end

    ####################################################################
    # Method: count_opponent
    #
    # Descirption: Check if there are any pieces of colour opponent_colour
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
    # Descirption: Determines if a move from the inital_postion to 
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
        
    end

    ####################################################################
    # Method: validate_neighbors
    #
    # Descirption: Checks if the selected position is valid.
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
    # Method: capture_avaliable
    #
    # Descirption: Looks at the board_hash and checks if there are any approach moves available
    #
    #
    # Returns:     True :  If an approach move is available
    #              False:  Otherwise
    ####################################################################
    def capture_avaliable()

    end


end
