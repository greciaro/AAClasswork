Problem 1:
Given a file path:
/users/app_academy_work/curriculumn/ruby/../sql/./../rails
Reduce this path to the shortest possible path:
/users/app_academy_work/curriculumn/rails
What ADT you can use to solve this problem?
Keep in mind that ../ means traveling up a directory and ./ means searching in the current directory.

Pseudocode
1. Recieve the path as string                                           #"/users/app_academy_work/curriculumn/ruby/../sql/./../rails"
2. Split the path string with "/" to turn it into an array              #[users, app_academy_work, curriculumn, ruby, .., sql, ., .., rails]
3. Iterate over each element of the array
    3.1 start at the second element and verify each element afterwards
    3.2 


Problem 2:
Given an array of integers A sorted in non-decreasing order, return an array of the squares of each number, also in sorted non-decreasing order.
Attempt to do this in O(n) time complexity.
Example 1:
Input: [-4,-1,0,3,10]
Output: [0,1,9,16,100]
Example 2:
Input: [-7,-3,2,3,11]
Output: [4,9,9,49,121]
Note:
1 <= A.length <= 10000
-10000 <= A[i] <= 10000
A is sorted in non-decreasing order.