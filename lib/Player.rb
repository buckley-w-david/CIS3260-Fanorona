####################################################################
# Class: Player
# Date Created: Oct. 31 2017
#
# Description: Stores information about the user's currently
#              playing the game.
####################################################################

class Player


    ####################################################################
    # Method: initialize
    #
    # Description: Initializes a user.
    #
    # Arguments:   new_name: The Name of the Player (String)
    #              newColour: The colour of the player (Symbol)
    ####################################################################
    def initialize(colour, current_board)

    	# Player's Name
    	@name       = nil

    	# Player's Team colour
        # This will be a symbol of some sort
    	@colour     = colour

        # The destination of the last move that the player made
        @last_location = [0,0]
        # Keeps track of if the first move in each turn has been made
        @first_move    = true

        # A copy of the Board class' current state
        @current_board  = current_board
    end

    ####################################################################
    # Method: set_name
    #
    # Description: Asks the user to input a name. The set the name.
    #
    ####################################################################
    def set_name()
        # @name = Prompt for Name
        print "[#{@colour}] Enter your name: "
        @name = gets.strip

    end

    ####################################################################
    # Method: do_move
    #
    # Description:
    #
    # returns: - :A - If the completed move was an Approaching move
    #          - :W - If the completed move was a Withdrawling move
    #          - :P - If the completed move was a Paika move
    ####################################################################
    def do_move()


        # Check if first_move is true
        if @first_move
            #    Prompt the user for an inital position
            initialPos = prompt_for_postion("[#{@name}] Initial position: ")

        end

        # prompt the user for a new position
        newPos = prompt_for_postion("[#{@name}] New position: ")
        action = :N

        while action == :N
           action = @current_board.action(newPos, initialPos, @colour)

           case action
           when :E

               @first_move = true
               @last_location = [0,0]

           when :A, :W, :P

               @first_move = false
               @last_location = newPosition
           else
           end
           # if this is the first move, prompt for a starting position
           if @first_move
               initialPos = prompt_for_postion("[#{@name}] Initial position: ")
           end

           # prompt for a new position
           newPos = prompt_for_postion("[#{@name}] New position: ")
        end

        return action
    end


    ####################################################################
    # Method: prompt_for_postion
    #
    # Description:
    #  prompts user for input and validates, returns as array format.
    #
    # returns: - Integer array with 2 elements.
    ####################################################################
    def prompt_for_postion(prompt)
        # pattern to match input as int,int with optional space
        pattern = /^(\d+), ?(\d+)$/
        endPattern = /^(-), ?(-)$/
        position = []

        while position == []

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
                position[0] = position[0].to_i
                position[1] = position[1].to_i

            elsif input.match(endPattern)
                position = ['-','-']
            end
        end
        return position
    end
end

newPlayer = Player.new(:Black, nil)
newPlayer.prompt_for_postion("fuck meu p: ")
