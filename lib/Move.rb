####################################################################
# Class: Move
# Date Created: Nov. 1 2017
#
# Descirption: Document has no overview of the Move class.
#              seems to hold methods that determine the effect each type
#              of move has on actual board. After determining the efftect 
#              that the move will have, The Intersections class uses
#              them to actually update the board (i think......) 
####################################################################

class Move



    ####################################################################
    # Method: initialize
    #
    # Descirption: Initializes a Move class.
    #
    ####################################################################
    def initialize()

    	# No instance variables given in the design document.
        # is an initialize method requred?
    end

    ####################################################################
    # Method: paika
    #
    # Descirption: Obtains an array of all the pieces affected by a paika move.
    # 
    #
    # Arguments:   initial    : A postion that a piece is moving from. (int array [xPos,yPos]) 
    #              next       : A position that a piece is moving to.  (int array [xPos,yPos]) 
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
    def paika(initial, next)
    	
    end

    ####################################################################
    # Method: withdrawl
    #
    # Descirption: Obtains an array of all the pieces affected by a withdrawl move.
    # 
    #
    # Arguments:   initial    : A postion that a piece is moving from. (int array [xPos,yPos]) 
    #              next       : A position that a piece is moving to.  (int array [xPos,yPos]) 
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
    def withdrawl(initial, next)

    end


    ####################################################################
    # Method: approach
    #
    # Descirption: Obtains an array of all the pieces affected by a approach move.
    # 
    #
    # Arguments:   initial    : A postion that a piece is moving from. (int array [xPos,yPos]) 
    #              next       : A position that a piece is moving to.  (int array [xPos,yPos]) 
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
    def approach()

    end
end
