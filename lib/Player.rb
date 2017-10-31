####################################################################
# Class: Player
# Date Created: Oct. 31 2017
#
# Descirption: From Doc: Stores information about the user's currently
#              playing the game.
#              From Nikolas: Seems to obtain user input and Ask 
#                            The Intersections class to make changes
#                            to the board.
####################################################################

class Player

    # NOTE: Add Accessors for public variables

    ####################################################################
    # Method: initialize
    #
    # Descirption: Initializes a user.
    #
    # Arguments:   new_name: The Name of the Player (String)         
    #              newColour: The colour of the player (String)
    ####################################################################
    def initialize(newName, newColour)

    	# Player's Name
    	@name       = newName

    	# Player's Team colour
    	@colour     = newColour

    	# Last location the player's moving piece has been (int array[2]. [xPos,yPos])
    	# NOTE: Class diagram class this "last_piece", Detailed list of classes calls it
    	#       "last_location" 
    	@last_piece = Array.new(2) # Maybe. IDK what the default value is.
    end

    ####################################################################
    # Method: update
    #
    # Descirption: Takes in user input and sends the information to the 
    #              Intersection class.
    #
    # returns: void
    ####################################################################
    def update()
    end

    ####################################################################
    # Method: input
    #
    # Descirption: Gets and returns a user's initial and new position
    #
    # returns: Some sort of intereger array that stores some sort of 
    #          position???????
    ####################################################################
    def input()
    end


    ####################################################################
    # Method: change_turn()
    #
    # Descirption: Checks the player's new position to see if they have
    #              ended their turn.
    #
    # Arguments:   new_position: Integer array of size 2 representing some 
    #                            sort of position. NEEDS TO BE CLARIFIDE T_T 
    #
    # Returns:     False:  If the player can make another move.
    #              True :  Otherwise
    ####################################################################
    def change_turn(new_position)
    	puts "Kill me now"
    end
end
