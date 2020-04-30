# Lets populate the Piece parent class that contains the functionality common to all pieces. A key method of Piece is #moves, which should return an array of places a Piece can move to. Of course, every piece will move differently, so you can't write (implement) the #moves method of Piece without subclasses.

# NB You will not implement tricky moves like "en passant". Don't implement castling, draws, or pawn promotion either. You will handle check and check mate, however.

# You should make modules for Slideable and Stepable. The Slideable module can implement #moves, but it needs to know what directions a piece can move in (diagonal, horizontally/vertically, both). Classes that include the module Slideable (Bishop/Rook/Queen) will need to implement a method #move_dirs, which #moves will use.

# Your Piece will need to (1) track its position and (2) hold a reference to the Board. Classes that include Slideable in particular need the Board so they know to stop sliding when blocked by another piece. Don't allow a piece to move into a square already occupied by the same color piece, or to move a sliding piece past a piece that blocks it.

# The NullPiece class should include the singleton module. It will not need a reference to the Board - in fact its initialize method should take no arguments. Make sure you have a way to read its color and symbol.

# Lastly, make your Pawn class. Be sure to use the Chess UML Diagram to guide you on what methods and instance variables to define for this class!

# After completing each piece load the file in pry and make sure it moves properly. Once you have completed all pieces refactor your Board#initialize so that all your pieces are placed in their respective starting positions.

# Time to test! Open up pry and load 'board.rb'. Create an instance of Board and check out different positions with board[pos]. Do you get back instances of the type of pieces you expect? Can you move the pieces around?

# For now, do not worry if a move leaves a player in check.

# Once you are finished with phases I & II head over to Part Two.


class Piece
    attr_reader :valid_moves
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def valid_moves
        @valid_moves = []
        return self.valid_moves
    end

end

