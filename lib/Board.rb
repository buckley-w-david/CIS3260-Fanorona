####################################################################
# Class: Board_View
# Date Created: Nov. 2 2017
#
# Description:  The game baord and it's functions.
####################################################################

require_relative "move"

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
            '4,0' => :Black,
            '4,1' => :Black,
            '4,2' => :Black,
            '4,3' => :Black,
            '4,4' => :Black,
            '4,5' => :Black,
            '4,6' => :Black,
            '4,7' => :Black,
            '4,8' => :Black,
            '3,0' => :Black,
            '3,1' => :Black,
            '3,2' => :Black,
            '3,3' => :Black,
            '3,4' => :Black,
            '3,5' => :Black,
            '3,6' => :Black,
            '3,7' => :Black,
            '3,8' => :Black,
            '2,0' => :Black,
            '2,2' => :Black,
            '2,5' => :Black,
            '2,7' => :Black,

            # white pieces
            '1,0' => :White,
            '1,1' => :White,
            '1,2' => :White,
            '1,3' => :White,
            '1,4' => :White,
            '1,5' => :White,
            '1,6' => :White,
            '1,7' => :White,
            '1,8' => :White,
            '0,0' => :White,
            '0,1' => :White,
            '0,2' => :White,
            '0,3' => :White,
            '0,4' => :White,
            '0,5' => :White,
            '0,6' => :White,
            '0,7' => :White,
            '0,8' => :White,
            '2,1' => :White,
            '2,3' => :White,
            '2,6' => :White,
            '2,8' => :White,
            
            # the empty middle space
            '4,2' => :Empty
            
        }


        # initialize Weak and strong positions List
        @strong = [
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

        @weak = [
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
        @affected_pieces = Move.new(@board_hash)
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
        if new_position[0] == '-' && new_position[1] == '-' then
            @last_direction = nil;
            return :E
        end

        if validate(new_position, initial_position) then 
            return :N
        end

        move_type = move_type(new_position, initial_position)
        move = Move.new(@board_hash)
        @affected_pieces = nil
        case move_type 
            when :N 
                return :N

            when :A 
                @affected_pieces = move.approach(initial_position, new_position)

            when :W 
                @affected_pieces = move.withdraw(initial_position, new_position)

            when :P 
                @affected_pieces = move.paika(initial_position, new_position)
        end

        update_board(@affected_pieces)
        set_last_direction(new_position, initial_position)
        return move_type;

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
    # Description: Determines if a move from the initial_postion to 
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

        if !validate_piece(initial_position) then
            return false;
        end

        if !validate_neighbors(new_position, initial_position) then
            return false;
        end

        if !validate_direction(new_position, initial_position) then 
            return false
        end

        return true;
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
        pos_as_str = "#{initial_position[0]},#{initial_position[1]}"
        return @board_hash[pos_as_str] == :Black || @board_hash[pos_as_str] == :White
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
        if find_direction(new_position, initial_position) == @last_direction
            return true;
        end

        return false;
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
    def find_direction(new_position, initial_position)
        pos_diff = [
            new_position[0] - initial_position[0], 
            new_position[1] - initial_position[1]
        ]
        
        # Need to scale the value down to eliminate extra cases to change. e.g. moving from position 2,2 to 0,0
        pos_diff_scaled = []
        pos_diff_scaled[0] = pos_diff[0] == 0 ? 0 : pos_diff[0]/pos_diff[0].abs
        pos_diff_scaled[1] = pos_diff[1] == 0 ? 0 : pos_diff[1]/pos_diff[1].abs

        case pos_diff_scaled
        when [1,0]
            return :N
        when [1,1]
            return :NE
        when [0,1]
            return :E
        when [-1,1]
            return :SE
        when [-1,0]
            return :S
        when [-1,-1]
            return :SW
        when [0,-1]
            return :W
        when [1,-1]
            return :NW
        end

        return nil
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
        if is_approach(new_position, initial_position) then
            return :A
        elsif is_withdraw(new_position, initial_position) then
            return :W
        elsif capture_avaliable() then
            return :N
        else 
            return :P
        end
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
        direction = find_direction(new_position, initial_position)
        pos_adjustment = []
        case direction
        when :N
            pos_adjustment =  [1,0]
        when :NE
            pos_adjustment =  [1,1]
        when :E
            pos_adjustment =  [0,1]
        when :SE
            pos_adjustment =  [-1,1]
        when :S
            pos_adjustment =  [-1,0]
        when :SW
            pos_adjustment =  [-1,-1]
        when :W
            pos_adjustment =  [0,-1]
        when :NW
            pos_adjustment =  [1,-1]
        end
        new_x = new_position[0] + pos_adjustment[0]
        new_y = new_position[1] + pos_adjustment[1]
        adj_piece_in_dir = "#{new_x}, #{new_y}"

        initial_position_as_str = "#{initial_position[0]},#{initial_position[1]}"
        initial_position_color = @board_hash[initial_position_as_str]

        if @board_hash[adj_piece_in_dir] != initial_position_color && @board_hash[adj_piece_in_dir] != :Empty then
            return true
        end

        return false
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
    def is_withdraw(new_position, initial_position)
        direction = find_direction(new_position, initial_position)
        pos_adjustment = []
        case direction
        when :N
            pos_adjustment =  [1,0]
        when :NE
            pos_adjustment =  [1,1]
        when :E
            pos_adjustment =  [0,1]
        when :SE
            pos_adjustment =  [-1,1]
        when :S
            pos_adjustment =  [-1,0]
        when :SW
            pos_adjustment =  [-1,-1]
        when :W
            pos_adjustment =  [0,-1]
        when :NW
            pos_adjustment =  [1,-1]
        end

        # if new_position is at an empty space  
        # and if 1 space in the opposite direction of the inital_position is the opponents colour
        # it is a withdraw
        adj_x = initial_position[0] - pos_adjustment[0]
        adj_y = initial_position[1] - pos_adjustment[1]
        check_pos_as_str =  "#{adj_x},#{adj_y}" #This is the string representation of position that is 2 spaces away from new
        
        initial_position_as_str = "#{initial_position[0]},#{initial_position[1]}"
        initial_position_color = @board_hash[initial_position_as_str]
        new_position_as_str = "#{new_position[0]},#{new_position[1]}"

        if @board_hash[check_pos_as_str] != :Empty && @board_hash[check_pos_as_str] != initial_position_color && 
            @board_hash[new_position_as_str] == :Empty

            return true;
        end

        return false
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
        for position in affected_pieces
            # position[0] is the x coord 
            # position[1] is the y coord
            # position[2] is the changed value at the position x,y
            position_as_str = "#{position[0]},#{position[1]}"
            @board_hash[position_as_str] = position[2]
        end
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
        @last_direction = find_direction(new_position, last_direction)
    end
end

testBoard = Board.new

p testBoard.find_direction([1,1],[2,2])
p testBoard.find_direction([2,1],[2,2])
p testBoard.find_direction([3,1],[2,2])
p testBoard.find_direction([3,2],[2,2])
p testBoard.find_direction([3,3],[2,2])
p testBoard.find_direction([4,4],[2,2])
p testBoard.is_approach([4,2], [1,3]);
p testBoard.is_withdraw([4,2], [1,3]);
