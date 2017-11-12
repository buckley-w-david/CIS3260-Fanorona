####################################################################
# Class: Move
# Date Created: Nov. 1 2017
#
# Description: Methods to determine the effect each type
#              of move has on actual board. After determining the efftect
#              that the move will have, The Intersections class uses
#              them to actually update the board.
####################################################################
# require_relative 'Board'

class Move


    ####################################################################
    # Method: initialize
    #
    # Description: Initializes a Move class.
    #
    ####################################################################
    def initialize(current_board)

        # A current representation of  the board
        @board_hash     = current_board
    end

    ####################################################################
    # Method: paika
    #
    # Description: Obtains an array of all the pieces affected by a paika move.
    #
    #
    # Arguments:   initial    : A position that a piece is moving from. (int array [xPos,yPos])
    #              next_position_position       : A position that a piece is moving to.  (int array [xPos,yPos])
    #
    # Returns:     A list of all the pieces affected by a paika move in the form:
    #              [[xPos, yPos, newIntersectionState]... ]
    #              where:
    #                 - xPos and yPos represent the effected intersection's x and y coordinates
    #                 - newIntersectionState is
    #                    - "E" if intersection is empty due to the move
    #                    - "B" if the intersection now have a Black piece on it
    #                    - "W" if the intersection now have a White piece on it
    ####################################################################
    def paika(initial, next_position)

        # append the initial position as empty
        affected_pieces = Array.new
        affected_pieces << [initial[0], initial[1], :Empty]

        # retreive the colour of the piece being moved
        initial_key = array_to_board_key(initial)
        initial_colour = @board_hash[initial_key]

        # append the new position as the colour of the piece that was moved
        affected_pieces << [next_position[0], next_position[1], initial_colour]
    end

    ####################################################################
    # Method: withdrawl
    #
    # Description: Obtains an array of all the pieces affected by a withdrawl move.
    #
    #
    # Arguments:   initial    : A position that a piece is moving from. (int array [xPos,yPos])
    #              next_position       : A position that a piece is moving to.  (int array [xPos,yPos])
    #
    # Returns:     A list of all the pieces affected by a withdrawl move in the form:
    #              [[xPos, yPos, newIntersectionState]... ]
    #              where:
    #                 - xPos and yPos represent the effected intersection's x and y coordinates
    #                 - newIntersectionState is
    #                    - "E" if intersection is empty due to the move
    #                    - "B" if the intersection now have a Black piece on it
    #                    - "W" if the intersection now have a White piece on it
    ####################################################################
    def withdrawl(initial, next_position)

        # append the initial position as empty
        affected_pieces = self.paika(initial, next_position)
        # retreive the colour of the piece being moved
        initial_key = array_to_board_key(initial)
        initial_colour = @board_hash[initial_key]

        ### Taken from Board.find_direction ###
        # need to find direction of movement as a positive, negative, or zero
        # in order to calculate path of movement
        pos_diff = [
            next_position[0].to_i - initial[0].to_i,
            next_position[1].to_i - initial[1].to_i
        ]

        # Need to scale the value down to eliminate extra cases to change. e.g. moving from position 2,2 to 0,0
        move_transformation = []
        move_transformation[0] = pos_diff[0] == 0 ? 0 : pos_diff[0]/pos_diff[0].abs
        move_transformation[1] = pos_diff[1] == 0 ? 0 : pos_diff[1]/pos_diff[1].abs

        # invert the move transformation in order to evaluate the opposite direction
        withdrawl_move_transformation = []
        withdrawl_move_transformation[0] = move_transformation[0] * -1
        withdrawl_move_transformation[1] = move_transformation[1] * -1

        # apply the transformation as a move
        interim_position = []
        interim_position[0] = initial[0] + withdrawl_move_transformation[0]
        interim_position[1] = initial[1] + withdrawl_move_transformation[1]

        # repeat transformation until an empty space or initial_colour is found
        while (@board_hash[array_to_board_key(interim_position)])

            # retrieve position from hash
            transformed_state = @board_hash[array_to_board_key(interim_position)]
            # puts(array_to_board_key(interim_position) + "#{transformed_state}")

            # check transformed positon state
            if transformed_state != initial_colour

                # append position if affected
                affected_piece = [interim_position[0], interim_position[1], :Empty]
                affected_pieces << affected_piece
            else
                # position is not affected and the move can exit
                return affected_pieces
            end

            # continue to apply transformation
            interim_position[0] += withdrawl_move_transformation[0]
            interim_position[1] += withdrawl_move_transformation[1]
        end

        return affected_pieces
    end


    ####################################################################
    # Method: approach
    #
    # Description: Obtains an array of all the pieces affected by a approach move.
    #
    #
    # Arguments:   initial    : A postion that a piece is moving from. (int array [xPos,yPos])
    #              next_position       : A position that a piece is moving to.  (int array [xPos,yPos])
    #
    # Returns:     A list of all the pieces affected by a approach move in the form:
    #              [[xPos, yPos, newIntersectionState]... ]
    #              where:
    #                 - xPos and yPos represent the effected intersection's x and y coordinates
    #                 - newIntersectionState is
    #                    - "E" if intersection is empty due to the move
    #                    - "B" if the intersection now have a Black piece on it
    #                    - "W" if the intersection now have a White piece on it
    ####################################################################
    def approach(initial, next_position)

                # append the initial position as empty
                affected_pieces = self.paika(initial, next_position)
                # retreive the colour of the piece being moved
                initial_key = array_to_board_key(initial)
                initial_colour = @board_hash[initial_key]

                ### Taken from Board.find_direction ###
                # need to find direction of movement as a positive, negative, or zero
                # in order to calculate path of movement
                pos_diff = [
                    next_position[0].to_i - initial[0].to_i,
                    next_position[1].to_i - initial[1].to_i
                ]

                # Need to scale the value down to eliminate extra cases to change. e.g. moving from position 2,2 to 0,0
                move_transformation = []
                move_transformation[0] = pos_diff[0] == 0 ? 0 : pos_diff[0]/pos_diff[0].abs
                move_transformation[1] = pos_diff[1] == 0 ? 0 : pos_diff[1]/pos_diff[1].abs


                # apply the transformation as a move
                interim_position = []
                interim_position[0] = next_position[0] + move_transformation[0]
                interim_position[1] = next_position[1] + move_transformation[1]

                # repeat transformation until an empty space or initial_colour is found
                while (@board_hash[array_to_board_key(interim_position)])

                    # retrieve position from hash
                    transformed_state = @board_hash[array_to_board_key(interim_position)]
                    # puts(array_to_board_key(interim_position) + "#{transformed_state}")

                    # check transformed positon state
                    if transformed_state != initial_colour

                        # append position if affected
                        affected_piece = [interim_position[0], interim_position[1], :Empty]
                        affected_pieces << affected_piece
                    else
                        # position is not affected and the move can exit
                        return affected_pieces
                    end

                    # continue to apply transformation
                    interim_position[0] += move_transformation[0]
                    interim_position[1] += move_transformation[1]
                end

                return affected_pieces
    end

end

def array_to_board_key(array)
    board_key = "#{array[0]},#{array[1]}"
end
