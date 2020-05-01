require "first_tdd"
require 'byebug'
    
describe "#my_uniq" do
    let (:arr) {[1, 2, 3]}

   
    before (:each)do 
        expect(arr).not_to receive(:uniq)
    end
   

    it 'raises an error if the argument is not an array' do
        expect {my_uniq(1)}.to raise_error("invalid data type")
    end

    it 'removes duplicates from the array'do
        expect(my_uniq(arr)).to eq([1, 2, 3])
    end

#     
# # debugger
      
#     end
end

describe Array do
    describe '#two_sum'do
        it "finds all pairs of positions where the elements at those positions sum to zero" do
            expect([-1, 0, 2, -2, 1].two_sum).to include([2, 3], [0, 4])
        end

        it 'returns array of pairs sorted dictionary-wise' do
            expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
        end
    end
end #end of class

describe "#my_transpose" do 
    let (:rows) { [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8]
        ] }

    let (:cols) { [
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8] 
        ] }

    let (:row1) {rows[0]}
    let (:col1) {cols[0]}

    it 'converts between the row-oriented and column-oriented representations' do
        expect(my_transpose(rows)).to eq(cols)
    end
end

describe "#stock_picker" do
    let (:arr) { [6, 3, 8, 9, 2, 4] } #[2, 4] [3, 9]

    it "outputs the most profitable pair of days on which to first buy the stock and then sell the stock" do
        expect(stock_picker(arr)).to eq([1, 3])
    end

    it "doesn\'t sell stocks before buying" do
        result = stock_picker(arr)
        expect(arr[result[0]] < arr[result[1]]).to be true
    end
end


 