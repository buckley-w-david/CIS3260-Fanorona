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
    def initialize(newColour)

    	# Player's Name
    	@name       = nil

    	# Player's Team colour
        # This will be a symbol of some sort
    	@colour     = newColour

        # The destination of the last move that the player made
        @last_location = [0,0]
        # Keeps track of if the first move in each turn has been made
        @first_Move    = true

        # A copy of the Board class' current state
        @current_board  = ""
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
        print "Enter your name: "
        @name = gets.strip

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
        if @first_move
            #    Prompt the user for an inital position
            print "Initial position: "
            initialPos = gets.strip

        end

        # prompt the user for a new position
        print "New position: "
        newPos = gets.strip
        action = ""

        while action != :N
           action = @current_board.action()
           if @first_move
               print "Initial position: "
               initialPosition = gets.strip
               print "New position: "
               newPosition = gets.strip
           end
        #    if var == :E
        #       last_location = 0,0
        #    else
        #        last_location = lastLocation_ofMove
        #        first_move = False
        #
        end
    end



    # TODO: DELETE THIS METHOD :)
    def get_name()
        puts @name
    end


    ####################################################################
    # Method: prompt_for_postion
    #
    # Descirption:
    #  prompts user for input and validates, returns as array format.
    #
    # returns: - Integer array with 2 elements.
    ####################################################################
    def prompt_for_postion(prompt)
        # pattern to match input as int,int with optional space
        pattern = /^(\d+), ?(\d+)$/

        # prompt user with provided message
        print prompt

        # retrieve user input and strip trailing whitespace
        input = gets.strip

        # if input is valid, get it into a usable form
        if input.match(pattern)
            # remove optional space
            position = input.delete(' ')
            # split on comma
            position = position.split(',')
        end
    end
end

player = Player.new("Red")
puts(player.prompt_for_postion("do it: "))
# player.set_name()
# player.get_name()
