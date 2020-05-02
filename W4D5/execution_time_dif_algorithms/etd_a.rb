require 'benchmark'

# # My_mind

# #Phase 1
# def my_min(int_list)
#     min = 0
#     int_list.each  do |i|
#         int_list.each  do |j|
#             min= j if j < min
#         end
#     end
#     min
# end

# #Phase 2
# def my_min2(int_list)
#     pre_min = int_list[0]
#     min = 0
#     (0...int_list.length - 1).each do |i|
#         min = int_list[i] if int_list[i] < int_list[i+1]
#         pre_min = min if min < pre_min
#     end
#     pre_min
# end

# list = (0..1000).to_a

# Benchmark.bm do |x|
#     x.report {my_min(list)}
#     x.report {my_min2(list)}
# end

# p my_min(list)  # =>  -5
# p my_min2(list)  # =>  -5




# Largest Contiguous Sub-sum



#Phase 1
def largest_contiguous_subsum(list)
    sum = 0
    array =  []
    (0...list.length).each do |i|
         (0...list.length).each do |j|
            array << list[i..j] if i <= j
         end
    end
    array.each do |sub_arr|
        sum = sub_arr.sum if sub_arr.sum > sum
    end

    sum
end

# [2, 3, -5, 7, -6, 7, -4]

#Phase 2
def largest_contiguous_subsum2(list)
    top_score = list[0]

    list.inject do |acc, el| # i = 0, top = 2, acc = 2, el = 3 ////  i = 1, top = 5, acc = 5 el = -5 /// i = 2, top = 5, acc = 0, el = 7 /// i = 3, top = 7, acc = 7, el = -6 /// i = 4 top = 7, acc=1, el = 7 /// i = 5 top=8, acc = 8, el = -4
        if acc < 0
            if el > acc
                top_score = el if el > top_score
                el
            else 
                el
            end
        else
            if el > 0 #yes /// no /// yes /// yes
                top_score = acc + el if acc + el > top_score # top = acc + el = 5 /// top = acc + el = 7 /// top = 8
                acc + el # acc += el = 5 /// acc += el = 7 /// acc += el = 8
            else # yes /// yes
                if acc + el < 0
                    0
                else
                    acc + el # 5 + -5 = 0 /// 7 -6 = 1
                end
            end
        end
    end
    top_score
end

list = [5, 3, -7]
list2 = [2, 3, -5, 7, -6, 7, -4]
list3 = [-4,-9,-8,-3,1000,-10,-100,-889,-99999,5000]
list4 = [-9, -11, -13, -19, -8, -3, -5, -10] # => -3

p largest_contiguous_subsum2(list)
p largest_contiguous_subsum2(list2)
p largest_contiguous_subsum2(list3)
p largest_contiguous_subsum2(list4)



