# The PEDAC process

## P: Understanding the Problem

  - Establish the rules/ define the boundaries of the problem
  - Assess available information 
  - Restate Explicit requirements (clearly defined in the problem)
  - Identify Implicit requirements
      - not stated in problem description
      - extrapolated from our understanding and test cases
  - Spend enough time. Dont rush this step.

## E: Examples and Test Cases

  - Can confirm/ refute assumptions
  - Help to answer questions about implicit requirements
  - Act as assertions which help to codify the rules and boundaries

## D: Data structures

  - Help reason with data logically
  - Help interact with data at implementation level
  - Thinking in terms of data structures is part of problem solving process
  - Data structures are closely linked to algorithm
    - Set of steps from input to output
      - Involves structuring data in a certain way

## A: Algorithms

  - A logical sequence of steps for accomplishing a task or objective
    - Closely linked to data structures
    - Series of steps to structure data to produce the required output

  - Stay abstract/ high-level
    - Avoid implementation detail (no pseudocode, code or methods)
    - Don't worry about efficiency for now

## C: Implementing a solution in Code

  - Translating solution algorithm to code
  - Think about algorithm in context of programming language
    - Language features and constraints
    - Characteristics of data structures
    - Built in functions/ methods
    - Syntax and coding patterns
  - Create test cases
  - Code with intent

**Sum Even Number Rows**

Imagine a sequence of consecutive even integers beginning with 2. The integers are grouped in rows, with the first row containing one integer, the second row two integers, the third row three integers, and so on. Given an integer representing the number of a particular row, return an integer representing the sum of all the integers in that row.

**Rules/ requirements**

- Sequence of integers
- Sequence begins with two
- Integers are consecutive
- Sequence is grouped into rows
- Each row incrementally larger: 1, 2, 3, ...
- Row 'number' equals number of elements in that row
  - Row 1 has 1 element, row 2 has 2 elements, ...
- Input: a single integer
  - Identifies a 'row', which is a subset of a sequence of integers
- Output: a single integer
  - The sum of the integers in the row identified by the input integer

- Sequence:
2, 4, 6, 8, 10, 12, 14, 16, 18, 20, ...

**Examples**

row number: 1 --> sum of integers in row: 2
row number: 2 --> sum of integers in row: 10
row number: 4 --> sum of integers in row: 68

2 --> 2
4, 6 --> 10
14, 16, 18, 20 --> 68

**Data Structure**

2
4, 6
8, 10, 12
14, 16, 18, 20
....

- Overall structure representing sequence as a whole
- Individual rows within overall structure
- Individual rows in a set order in context of sequence
- Individual rows contain integers
- Can assume that integers are in a set order in the context of the sequence

[
  [2],
  [4, 6],
  [8, 10, 12],
  [14, 16, 18, 20],
  ....
]

**Algorithm**

1. Create an empty 'rows' array to contain all of the rows
2. Create a 'row' array and it to the overall 'rows' array
3. Repeat step 2 until all the necessary rows have been created
  - rows have been created when the length of the 'rows' array is equal to the input integer
4. Sum the final row
5. Return the sum

*Problem: Create a Row*

Rules:
- Row is an array
- Arrays contain integers
- Integers are consecutive even numbers
- Integers in each row form part of an overall larger sequence
- Rows are of different lengths
- Input: the information needed to create the output
  - The starting integer
  - Length of the row
- Output: the row itself: `[8, 10, 12]`

Examples:
start: 2, length: 1 --> [2]
start: 4, length: 2 --> [4, 6]
start: 8, length: 3 --> [8, 10, 12]

Data structures:
- An array of integers

Algorithm:
1. Create an empty 'row' array to contain the integers
2. Add the starting integer
3. Increment the starting integer by 2 to get the next integer in the sequence
4. Repeat steps 2 & 3 until the array has reached the correct length
5. Return the 'row' array

## Final thoughts

- Not a completely linear process
- Move back and forwards between the steps
- Switch from implementation mode o abstract problem solving mode when necessary
- Don't try to problem solve at the code level



**ANOTHER EXAMPLE**

Given a string, write a method `palindrome_substrings` which returns
all the substrings from a given string which are palindromes. Consider
palindrome words case sensitive.

# Test cases:
```ruby
palindrome_substrings("supercalifragilisticexpialidocious") => ["ili"]
palindrome_substrings("abcddcbA") => ["bcddcb", "cddc", "dd"]
palindrome_substrings("palindrome") => []
palindrome_substrings("") => [] 
```

# Understanding the problem (write input, output and rules)
- input: string
- output: array of substrings that match palindrome rules
- rules: - substring must be a palindromes
       - palindrome words should be case sensitive

# Questions:
- Will inputs always be strings?

# PSEUDO-CODE
```
START

 /* Given a string named 'string' */

 SET result = []
 SET starting_index = 0

 WHILE starting_index <= length of string - 2
   SET numChars = 2
   WHILE numChars <= length of string - starting_index
     SET substring = num_chars characters from string starting at index starting_index
     append substring to result array
     SET num_chars = num_chars + 1

     SET starting_index = starting_index + 1

  RETURN result

END
```
is_palindrome method
============================
- Inside the `is_palindrome?` method, check whether the string
  value is equal to its reversed value. You can use the
  String#reverse method.

palindrome_substrings method
============================
- initialize a result variable to an empty array
- create an array named substring_arr that contains all of the
   substrings of the input string that are at least 2 characters long.
- loop through the words in the substring_arr array.
- if the word is a palindrome, append it to the result
   array
- return the result array

```ruby
def substrings(str)
  result = []
  starting_index = 0;

  while (starting_index <= str.length - 2)
    num_chars = 2
    while (num_chars <= str.length - starting_index)
      substring = str.slice(starting_index, num_chars)
      result << substring
      num_chars += 1
    end
    starting_index += 1
  end
  result
end

def is_palindrome?(str)
  return str == str.reverse
end

def palindrome_substrings(str)
  result = []
  substrings_arr = substrings(str)
  substrings_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

p palindrome_substrings("supercalifragilisticexpialidocious"); ["ili"]
p palindrome_substrings("abcddcbA");   ["bcddcb", "cddc", "dd"]
p palindrome_substrings("palindrome"); []
p palindrome_substrings("");           []
```
