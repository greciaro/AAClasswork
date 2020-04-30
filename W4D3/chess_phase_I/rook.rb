require_relative "piece" 
require "slideable" 

class Rook < Piece 
    include Slideable 

 def symbol
    "R "
 end

 def mov_dirs
    mov_dirs = []
    row = [-1,0,1]
    col = [-1,0,1]
    row.each_with_index do |ele1, idx1|
        col.each_with_index do |ele2, idx2|
            if idx2 > idx1
                mov_dirs << [ele1, ele2]
            end
        end
    end
    mov_dirs #[[]]
 end 

end #end of class 

if $PROGRAM_NAME == __FILE__
    p r = Rook.new("black", "board", [0, 0])
   
end   

#   0 1 2 3 4 5 6 7
#  0_ _ _ _ _ _ _ _
#  1_ _ _ _ _ _ _ _
#  2_ _ _ _ R _ _ _
#  3_ _ _ _ _ _ _ _
#  4_ _ _ _ _ _ _ _
#  5_ _ _ _ _ _ _ _
#  6_ _ _ _ _ _ _ _
#  7_ _ _ _ _ _ _ _