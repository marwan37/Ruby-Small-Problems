def sum_even_number_row(row_number)
  rows = []
  start_integer = 2
  (1..row_number).each do |current_row_number|
    rows << create_row(start_integer, current_row_number)
    start_integer = rows.last.last + 2
  end
  rows.last.sum
end

def create_row(start_integer, row_length)
  row = []
  current_integer = start_integer
  loop do
    row << current_integer
    current_integer += 2
    break if row.length == row_length
  end
  row
end



p sum_even_number_row(1) #== 2
p sum_even_number_row(2) #== 10
p sum_even_number_row(4) #== 68


# 1. Create an empty 'rows' array to contain all of the rows
# 2. Create a 'row' array and it to the overall 'rows' array
# 3. Repeat step 2 until all the necessary rows have been created
#   - rows have been created when the length of the 'rows' array is equal to the input integer
# 4. Sum the final row
# 5. Return the sum
