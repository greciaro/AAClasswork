require_relative "piece"
require "singleton"

class Null < Piece 
include Singleton 

def initialize 
@symbol = "_" 
@color = "_"
end 

end #end of class 

if $PROGRAM_NAME == __FILE__
        p np = Null.instance
       
end  

