####################################################################
# Class: Player
# Date Created: Oct. 31 2017
#
# Descirption: Stores information about the user's currently
#              playing the game.
####################################################################

class Player


    ####################################################################
    # Method: initialize
    #
    # Descirption: Initializes a user.
    #
    # Arguments:   new_name: The Name of the Player (String)         
    #              newColour: The colour of the player (Symbol)
    ####################################################################
    def initialize(newName, newColour)

    	# Player's Name
    	@name       = newName

    	# Player's Team colour
        # This will be a symbol of some sort
    	@colour     = newColour

        # The destination of the last move that the player made
        @last_location = [0,0]
        # Keeps track of if the first move in each turn has been made
        @first_Move    = true 
    end

    ####################################################################
    # Method: set_name
    #
    # Descirption: Asks the user to input a name. The set the name.
    #              ***** NOTE: This is in the document, but Nik thinks *****
    #              *********** it makes more sense to prompt outside *******
    #              *********** of the class and use the instructor *********
    #
    # Arguments:   new_name: The Name of the Player (String)         
    #              newColour: The colour of the player (Symbol)
    ####################################################################
    def set_name()
        # @name = Prompt for Name
    end

    ####################################################################
    # Method: do_move
    #
    # Descirption: 
    #
    # returns: - :A - If the completed move was an Approaching move 
    #          - :W - If the completed move was a Withdrawling move
    #          - :P - If the completed move was a Paika move
    ####################################################################
    def do_move()


        # Check if first_move is true
        #    Prompt the user for an inital position

        # prompt the user for a new position

        # while var!= :N
        #    var =  board.action()
        #    if var == :E
        #       last_location = 0,0
        #    else
        #        last_location = lastLocation_ofMove
        #        first_move = False
        #    
    end
end
