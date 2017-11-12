####################################################################
# Class: Board_View
# Date Created: Nov. 2 2017
#
# Description:  The game baord and it's functions.
####################################################################

require_relative "Move"
require 'pp'

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
            '4,2' => :Empty,
            
        }

        # initialize Weak and strong positions List
        @strong = [
            '0,0',
            '0,2',
            '0,4',
            '1,1',
            '1,3',
            '2,0',
            '2,2',
            '2,4',
            '3,1',
            '3,3',
            '4,0',
            '4,2',
            '4,4',
            '5,1',
            '5,3',
            '6,0',
            '6,2',
            '6,4',
            '7,1',
            '7,3',
            '8,0',
            '8,2',
            '8,4'
        ]

        @weak = [
            '0,1',
            '0,3',
            '1,0',
            '1,2',
            '1,4',
            '2,1',
            '2,3',
            '3,0',
            '3,2',
            '3,4',
            '4,1',
            '4,3',
            '5,0',
            '5,2',
            '5,4',
            '6,1',
            '6,3',
            '7,0',
            '7,2',
            '7,4',
            '8,1',
            '8,3'
        ]
        @last_direction = nil
        @affected_pieces = Move.new(@board_hash)
    end

    def get_board_hash(key)
        value = @board_hash[key]
        if (value == nil)
            return :invalid
        end
        return value
    end

    def get_affected_pieces()
        return @get_affected_pieces
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
    def action(new_position, initial_position, colour)
        if new_position[0] == '-' && new_position[1] == '-' then
            @last_direction = nil;
            return :E
        end

        if !validate(new_position, initial_position, colour) then 
            return :N
        end

        move_type = move_type(new_position, initial_position, colour)
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
    #          False: Otherwise
    ####################################################################
    def count_opponent(opponent_colour)
        #Check if opponents colour exists on the board
        #Returns true or false based on if opponent_colour is a value
        return !@board_hash.has_value?(opponent_colour)
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
    def validate(new_position, initial_position, colour)

        # Calls theses functions to validate the requested move:
        # validate_piece()
        # validate_neighbours()
        # validate_direction() 

        if !validate_piece(initial_position, colour) then
            return false;
        end

        if !validate_neighbours(new_position, initial_position) then
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
    def validate_piece(initial_position, colour)
        pos_as_str = "#{initial_position[0]},#{initial_position[1]}"
        # if the board hash is not initialized at pos_as_str then it returns nil
        return @board_hash[pos_as_str] == colour
    end

    ####################################################################
    # Method: validate_neighbours
    #
    # Description: Checks if the selected position is valid.
    #
    # Arguments:   new_position    : Position a piece is moving to.     (int array [xPos,yPos]) 
    #              initial_position: Position a piece is moving from to (int array [xPos,yPos]) 
    #
    # Returns: True : If the selected position is valid
    #          False: Otherwise
    ####################################################################
    def validate_neighbours(new_position, initial_position)
        var = get_neighbours(initial_position)
        # if newPosition is in var, move is valid
        return var.include?(new_position)

    end

    ####################################################################
    # Method: get_neighbours
    #
    # Description: Based on strength returns a list of all possible locations to move
    #
    # Arguments: initial_position: Position a piece 
    #
    # Returns: List[][2], the list of moves that are valid
    ####################################################################
    def get_neighbours(initial_position)
        neighbours = []
        #change incoming initial_position to a string
        pos_as_str = "#{initial_position[0]},#{initial_position[1]}"

        #check if initial_position is a strong or weak position
        strong = @strong.include?(pos_as_str)
        weak = @weak.include?(pos_as_str)
        x_pos = initial_position[0].to_i
        y_pos = initial_position[1].to_i

        #List of all possible positions
        possible_positions = [
            [0,4],
            [1,4],
            [2,4],
            [3,4],
            [4,4],
            [5,4],
            [7,4],
            [8,4],
            [0,3],
            [1,3],
            [2,3],
            [3,3],
            [4,3],
            [6,3],
            [7,3],
            [8,3],
            [0,2],
            [2,2],
            [5,2],
            [7,2],
            [0,0],
            [1,1],
            [2,1],
            [3,1],
            [4,1],
            [5,1],
            [6,1],
            [7,1],
            [8,1],
            [0,0],
            [1,0],
            [2,0],
            [3,0],
            [4,0],
            [5,0],
            [6,0],
            [7,0],
            [8,0],
            [1,2],
            [3,2],
            [6,2],
            [8,2],
            [4,2],
            [5,3],
            [6,4]
        ]

        #if position is weak, return weak positions
        if weak then
            adj_positions = [
                #North: +1, 0
                [x_pos + 1, y_pos],
                #East: 0, +1
                [x_pos, y_pos +1],
                #South: -1, 0
                [x_pos - 1, y_pos],
                #West: 0, -1
                [x_pos, y_pos - 1]
            ]

            #compare list of adj_positions to posible positions, store the matches in an new array
            neighbours = (adj_positions & possible_positions)
            return neighbours
        elsif strong
            adj_positions = [
                #North: +1, 0
                [x_pos + 1, y_pos],
                #NorthEast: +1, +1
                [x_pos + 1, y_pos +1],
                #East: 0, +1
                [x_pos, y_pos +1],
                #SouthEast: -1, +1
                [x_pos - 1, y_pos + 1],
                #South: -1, 0
                [x_pos - 1, y_pos],
                #SouthWest: -1, -1
                [x_pos - 1, y_pos - 1],
                #West: 0, -1
                [x_pos, y_pos - 1],
                #NorthWest: +1, -1
                [x_pos + 1, y_pos - 1]
            ]
            #compare list of adj_positions to posible positions, store the matches in an new array
            neighbours = (adj_positions & possible_positions)
            return neighbours      
        end
        return 
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
            return false;
        end

        return true;
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
            new_position[0].to_i - initial_position[0].to_i, 
            new_position[1].to_i - initial_position[1].to_i
        ]
        
        # Need to scale the value down to eliminate extra cases to change. e.g. moving from position 2,2 to 0,0
        pos_diff_scaled = []
        pos_diff_scaled[0] = pos_diff[0] == 0 ? 0 : pos_diff[0]/pos_diff[0].abs
        pos_diff_scaled[1] = pos_diff[1] == 0 ? 0 : pos_diff[1]/pos_diff[1].abs

        case pos_diff_scaled
        when [0,1]
            return :N
        when [1,1]
            return :NE
        when [1,0]
            return :E
        when [1,-1]
            return :SE
        when [0,-1]
            return :S
        when [-1,-1]
            return :SW
        when [-1,0]
            return :W
        when [-1,1]
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
    def move_type(new_position, initial_position, colour)

        if is_approach(new_position, initial_position) then
            return :A
        elsif is_withdraw(new_position, initial_position) then
            return :W
        elsif capture_available(colour) then
            return :N
        else 
            return :P
        end
    end

    ####################################################################
    # Method: is_approach
    #
    # Description: determines is a move is a withdrawn
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
            pos_adjustment =  [0,1]
        when :NE
            pos_adjustment =  [1,1]
        when :E
            pos_adjustment =  [1,0]
        when :SE
            pos_adjustment =  [1,-1]
        when :S
            pos_adjustment =  [0,-1]
        when :SW
            pos_adjustment =  [-1,-1]
        when :W
            pos_adjustment =  [-1,0]
        when :NW
            pos_adjustment =  [-1,1]
        end
        new_x = new_position[0].to_i + pos_adjustment[0].to_i
        new_y = new_position[1].to_i + pos_adjustment[1].to_i

        adj_piece_in_dir = "#{new_x},#{new_y}"

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
            pos_adjustment =  [0,1]
        when :NE
            pos_adjustment =  [1,1]
        when :E
            pos_adjustment =  [1,0]
        when :SE
            pos_adjustment =  [1,-1]
        when :S
            pos_adjustment =  [0,-1]
        when :SW
            pos_adjustment =  [-1,-1]
        when :W
            pos_adjustment =  [-1,0]
        when :NW
            pos_adjustment =  [-1,1]
        end

        # if new_position is at an empty space  
        # and if 1 space in the opposite direction of the initial_position is the opponents colour
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
    # Method: capture_available
    #
    # Description: Looks at the board_hash and checks if there are any approach or
    # withdraw moves available
    #               
    #
    # Returns:     True :  If an approach move or withdraw is available
    #              False:  Otherwise
    ####################################################################
    def capture_available(colour)

        #Save colour of current player and opponent
        if colour == :White
            opponents_colour = :Black
        elsif colour == :Black
            opponents_colour = :White
        end

        empty_positions = []
        #find all empty positions on the board
        @board_hash.each do |key, value|
            if value == :Empty
                empty_positions.push(key)
            end
        end

        $i = 0
        #loop through all empty intersections
        while $i < empty_positions.length  do
            formatted_empty_position = [empty_positions[$i].chars.first,empty_positions[$i].chars.last]
            empty_positions_neighbours = get_neighbours(formatted_empty_position)

            $j = 0
            #loop through all the empty position's neighbours
            while $j < empty_positions_neighbours.length do

                #Format position as a string example: "0,0"
                formatted_neighbour = "#{empty_positions_neighbours[$j]}"
                formatted_neighbour.slice! "["
                formatted_neighbour.slice! " "
                formatted_neighbour.slice! "]"


                neighbour_colour = @board_hash[formatted_neighbour]

                #If neighbour colour is equal to current players colour
                if neighbour_colour == colour
                    #call is_approach(new_position, initial_position)
                    #"new_position" is set as the empty space
                    #"initial_position" is set as the neighbour's position
                    #If is_approach or is_withdraw returns true, return true for capture_available
                    if ((is_approach(formatted_empty_position, empty_positions_neighbours[$j])) ||
                     (is_withdraw(formatted_empty_position, empty_positions_neighbours[$j])))
                    return true
                    end
                end
                $j +=1
            end
            $i +=1
        end
        return false
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
        @last_direction = find_direction(new_position, initial_position)
    end
end

test_board = Board.new
#p test_board.action(['-','-'],[])

#Testing count_opponent
#p test_board.count_opponent(:Black)
#p test_board.count_opponent(:White)
#p test_board.count_opponent(:Purple)

#Testing get_neighbours
#puts "Testing get_neighbours"
#puts "Strong positions:"
#p test_board.get_neighbours([3,1])
#puts "Weak positions:"
#p test_board.get_neighbours([1,0])
#p test_board.get_neighbours([4,2])

#puts "Testing capture_available"
#p test_board.capture_available(:White)
#p test_board.capture_available(:Black)
# p test_board.get_board_hash("4,2")
# p test_board.get_board_hash("3,1")
# p test_board.validate_piece([4,2], :White)

# p test_board.action([4,2], [4,1], :White)
# p test_board.move_type([4,1], [4,2], :White)
# p test_board.get_board_hash("4,2")