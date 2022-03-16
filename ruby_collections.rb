# COLLECTIONS: Contain multiple objects

# Strings => false collections
: only contain a single object, but can be referenced like collections

# slice: str.slice(start_index, length_chars)
str = 'The grass is green'
p str.slice(4, 5)

# array: similar slicing
arr = ['a', 'b', 'c', 'd', 'e', 'f', 'g']
arr[2, 3] # => ["c", "d", "e"]
arr[2, 3][0] # => "c"

arr = [1, 'two', :three, '4']
arr.slice(3, 1) # => ["4"]
arr.slice(3..3) # => ["4"]
arr.slice(3)    # => "4"

# array, verify if out fo bounds or truly nil -> fetch
arr = [3, 'd', nil]
arr[2] # => nil
arr[3] # => nil
arr.fetch(2) # => nil
arr.fetch(3) # => IndexError: index 3 outside of array bounds: -3...3
# same with hash
hsh = { :a => 1, 'b' => 'two', :c => nil }
hsh[:c]        # => nil
hsh[:d]        # => nil
hsh.fetch(:c)  # => nil
hsh.fetch(:d)  # => KeyError: key not found: :d

# splitting strings and joining arrays (removes spaces: see 2nd example)
str = 'Practice'
arr = str.chars # => ["P", "r", "a", "c", "t", "i", "c", "e"]
arr.join # => "Practice"
str = 'How do you get to Carnegie Hall?'
arr = str.split # => ["How", "do", "you", "get", "to", "Carnegie", "Hall?"]
arr.join        # => "HowdoyougettoCarnegieHall?"
arr.join(' ') # => "How do you get to Carnegie Hall?"
