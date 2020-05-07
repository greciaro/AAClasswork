require 'byebug'
# Problem 1:
# Given a pattern and a string str, determine if str follows the same pattern.
# Example 1
# Input: pattern = "abba", str = "dog cat cat dog"
# Output: true
# Example 2
# Input: pattern = "abba", str = "dog cat cat fish"
# Output: false
# Example 3
# Input: pattern = "aaaa", str = "dog cat cat dog"
# Output: false
# Example 4
# Input: pattern = "abba", str = "dog dog dog dog"
# Output: false
# You may assume pattern contains only lowercase letters, and str contains lowercase letters that may be separated by a single space. Can you solve it in O(N) time and O(1) space?

# def pattern_finder(pattern,str)
#     hash=Hash.new
#     str=str.split(' ')
    
#     pattern.each_char.with_index do |char,i|
#         if hash[char]
#             return false if hash[char]!= str[i] 

#         else
#             hash[char]=str[i]
#         end

#     end
#     return false if hash.values==hash.values.uniq

#     true

# end

# p pattern_finder("abba", "dog cat cat dog") #true
# p pattern_finder("abba", "dog cat cat fish") #false
# p pattern_finder("aaaa", "dog cat cat dog") #false
# p pattern_finder("abba", "dog dog dog dog") #false







# Problem 2:
# Given two strings S and T, return if they are equal when both are typed into empty text editors. In this case, # indicates a backspace character.
# Example 1
# Input: S = "ab#c", T = "ad#c"
# Output: true
# Explanation: Both S and T become "ac".
# Example 2
# Input: S = "ab##", T = "c#d#"
# Output: true
# Explanation: Both S and T become "".
# Example 3
# Input: S = "a##c", T = "#a#c"
# Output: true
# Explanation: Both S and T become "c".
# Example 4
# Input: S = "a#c", T = "b"
# Output: false
# Explanation: S becomes "c" while T becomes "b".
# Note:
# 1. 1 <= S.length <= 200
# 2. 1 <= T.length <= 200
# 3. S and T only contain lowercase letters and '#' characters.
# Can you solve it in O(N) time and O(1) space?


# 1. verify amount of '#' and the amount of "non #"
#     1.1. if they are equal we should return true 
# 2. split both strings using "#", this will return two arras without "#"
# 3. compare if the arrays are equal
#     3.1 if they are equal return true 
#     3.2 otherwise return false

def equal? (str1, str2)
    count1 = 0
    count2 = 0
    str1.each_char do |char|
        count1 += 1 if char == '#'
    end
    str2.each_char do |char|
        count2 += 1 if char == '#'
    end
    #debugger
    arr1 = str1.split('#')
    arr2 = str2.split('#')

    if str1.length - count1 == str2.length - count2
        if arr1 == arr2
        return true  
            else
        return false
        end
    end

    

    # arr1 == arr2

end



# p equal?("ab#c", "ad#c") # True
# p equal?("ab##", "c#d#") # True
# p equal?("a##c", "#a#c") # True
p equal?("a#c", "b") # False