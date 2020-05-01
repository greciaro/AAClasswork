# Remove dups
# Array has a uniq method that removes duplicates from an array. It returns the unique elements in the order in which they first appeared:

# [1, 2, 1, 3, 3].uniq # => [1, 2, 3]
# Write your own version of this method called my_uniq; it should take in an Array and return a new array.

def my_uniq(array)
    raise "invalid data type" unless array.is_a?(Array)
    h = {}
    array.each {|ele| h[ele] = true}
    h.keys
#   array.uniq
end


# Two sum
# Write a new Array#two_sum method that finds all pairs of positions where the elements at those positions sum to zero.

# NB: ordering matters. We want each of the pairs to be sorted smaller index before bigger index. We want the array of pairs to be sorted "dictionary-wise":

# [-1, 0, 2, -2, 1].two_sum # => [[0, 4], [2, 3]]
# [0, 2] before [2, 1] (smaller first elements come first)
# [0, 1] before [0, 2] (then smaller second elements come first)

class Array
    def two_sum
        positions = []

        self.each_with_index do |ele1, idx1|
            self.each_with_index do |ele2, idx2|
                if idx2 > idx1 && ele1 + ele2 == 0
                    positions << [idx1, idx2]            
                end
            end
        end

        positions
    end
end

def my_transpose(matrix)
    (0...matrix.length).map do |idx|
        matrix.map do |row|
            row[idx]
        end
    end
end

# Stock Picker
# Write a method that takes an array of stock prices (prices on days 0, 1, ...), and outputs the most profitable pair of days on which to first buy the stock and then sell the stock. Remember, you can't sell stock before you buy it!

def stock_picker(arr)
    pre_diff = 0
    res = []
    (0...arr.length).each do |i|
        (0...arr.length).each do |j|
            if j > i
                diff = arr[j] - arr[i]
                if diff > pre_diff
                    pre_diff = diff
                    res = [i, j]
                end
            end
        end
    end

    res
end


class Disc 
    attr_accessor :size, :pos
    def initialize(size, pos)
        @size = size 
        @pos = pos
    end
end

class Sticks
    def initialize
    @sticks = Array.new(3){Array.new([])}        
    end
end
