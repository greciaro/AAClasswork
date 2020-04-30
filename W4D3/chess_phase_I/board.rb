# Your Board class should hold a 2-dimensional array (an array of arrays). Each position in the board either holds a moving Piece or a NullPiece (NullPiece will inherit from Piece).

# There are many different kinds of pieces in chess, and each moves a specific way. Based on their moves, they can be placed in four categories:

# Sliding pieces (Bishop/Rook/Queen)
# Stepping pieces (Knight/King)
# Null pieces (occupy the 'empty' spaces)
# Pawns (we'll do this class last)
# To start off, you'll want to create an empty Piece class as a placeholder for now. Write code for #initialize so we can setup the board with instances of Piece in locations where a Queen/Rook/Knight/ etc. will start and nil where the NullPiece will start.

# The Board class should have a #move_piece(start_pos, end_pos) method. This should update the 2D grid and also the moved piece's position. You'll want to raise an exception if:

# there is no piece at start_pos or
# the piece cannot move to end_pos.
# Time to test! Open up pry and load 'board.rb'. Create an instance of Board and check out different positions with board[pos]. Do you get back Piece instances where you expect to? Test out Board#move_piece(start_pos, end_pos), does it raise an error when there is no piece at the start? Does it successfully update the Board?

# Once you get some of your pieces moving around the board, call over your TA for a code-review.

class Board
    attr_reader :grid, :populate 
    def initialize
        @grid = Array.new(8) {Array.new(8){|p| p = nil}}

        @grid = self.grid.each_with_index do |row, idx|
                if [0, 1, 6, 7].include?(idx)
                    row.each.with_index {|ele, idx| row[idx] = Place_holder_piece.new.name}
                end
            self 
        end
    end

    def [](pos) # we have to make sure we're putting an array here, within the brackets like b[[0,0]]
    row, col = pos 
    self.grid[row][col] 
    end  

    def []=(pos, val)
        row, col = pos 
        self.grid[row][col] = val 
    end

    def move_piece(start_pos, end_pos)
        (0..1).each do |i|
            raise ArgumentError.new "invalid position" if start_pos[i] > 7 || start_pos[i] < 0
            raise ArgumentError.new "invalid position" if end_pos[i] > 7 || end_pos[i] < 0
        end
        raise ArgumentError.new "no piece there" if self[start_pos].nil?
        piece = self[start_pos]
        self[start_pos] = nil
        self[end_pos] = piece  
    end 


end #end of class 


class Place_holder_piece
    attr_reader :name
    def initialize
        @name = "p"
        @position = [0,0]
    end
end


if $PROGRAM_NAME == __FILE__
        b = Board.new
        b.grid
        b.move_piece([0, 0],[3, 3])
        p b.grid 
       
end   