####################################################################
# Class: Validator
# Date Created: Oct. 31 2017
#
# Descirption: Document has no overview of the Validator class.
#              seems to be used to Validate that a provided move is
#              allowed before the move is actually made.
####################################################################

class Validator



    ####################################################################
    # Method: initialize
    #
    # Descirption: Initializes a Validator class.
    #
    ####################################################################
    def initialize()

    	# No instance variables given in the design document.
        # is an initialize method requred?
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

    	# Fromm added section "Flow":
    	# Calls :
    	# validate_piece()        # ????
    	# validate_neighbours()   # check_neighbors()???
    	# validate_direction()    # ????
    	
    end

    ####################################################################
    # Method: check_neighbors
    #
    # Descirption: Checks if initial_position's strength is strong or weak.
    #
    # Returns: A list of all possible locations to move to (int[[xPos,yPos]])
    ####################################################################
    def check_neighbors(initial_position)

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
