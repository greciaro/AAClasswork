require_relative "piece"
require_relative "stepable"

class King < Piece
    include Stepable
    
    def initialize(color, board, pos)
        super

    end
end

if $PROGRAM_NAME == __FILE__
        p k = King.new("black", "board", [0, 0])
       
end   