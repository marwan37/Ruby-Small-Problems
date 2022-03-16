produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruits(hsh)
  hsh.select { |k,v| v == 'Fruit' }
end

def select_fruit(produce_list)
  produce_keys = produce_list.keys
  counter = 0
  selected_fruits = {}

  loop do
    # this has to be at the top in case produce_list is empty hash
    break if counter == produce_keys.size

    current_key = produce_keys[counter]
    current_value = produce_list[current_key]

    if current_value == 'Fruit'
      selected_fruits[current_key] = current_value
    end

    counter += 1
  end

  selected_fruits
end

### Using each/select/map on Collections
## Each
# Iteration, doesn't consider return value of block, returns original collection, length untouched

## Select
# Selection, considers truthiness of return value, returns new collection, same length or less

## Map
# Transformation, considers return value, returns new collection, length untouched
