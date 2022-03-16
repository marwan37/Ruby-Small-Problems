## Enumerable#any?
[1, 2, 3].any? { |num| num > 2 }
# => true
{ a: "ant", b: "bear", c: "cat" }.any? { |key, value| value.size > 4 }
# => false

## Enumerable#all?
[1, 2, 3].all? { |num| num > 2 }
# => false
{ a: "ant", b: "bear", c: "cat" }.all? { |key, value| value.length >= 3 }
# => true

## Enumerable#each_with_index
[1, 2, 3].each_with_index do |num, index|
  puts "The index of #{num} is #{index}."
end

{ a: "ant", b: "bear", c: "cat" }.each_with_index do |pair, index|
  puts "The index of #{pair} is #{index}."
end
# The index of [:a, "ant"] is 0.
# ....

## Enumerable#each_with_object
[1, 2, 3].each_with_object([]) do |num, array|
  array << num if num.odd?
end
# => [1, 3]
{ a: "ant", b: "bear", c: "cat" }.each_with_object([]) do |pair, array|
  array << pair.last
end
# => ["ant", "bear", "cat"]
{ a: "ant", b: "bear", c: "cat" }.each_with_object({}) do |(key, value), hash|
  hash[value] = key
end
# => { "ant" => :a, "bear" => :b, "cat" => :c }

## Enumerable#first
[1, 2, 3].first # => 1
{ a: "ant", b: "bear", c: "cat" }.first(2) # => [[:a, "ant"], [:b, "bear"]]

## Enumerable#include?
[1, 2, 3].include?(1) # => true
# When called on a hash, include? only checks the keys, not the values.
{ a: "ant", b: "bear", c: "cat" }.include?("ant")
# => false
{ a: "ant", b: "bear", c: "cat" }.include?(:a)
# => true

## Enumerable#partition
[1, 2, 3].partition do |num|
  num.odd?
end
# => [[1, 3], [2]]

odd, even = [1, 2, 3].partition do |num|
  num.odd?
end
odd  # => [1, 3]
even # => [2]

#Even if the collection is a hash, the return value of partition will always be an array.
long, short = { a: "ant", b: "bear", c: "cat" }.partition do |key, value|
  value.size > 3
end
# => [[[:b, "bear"]], [[:a, "ant"], [:c, "cat"]]]
long.to_h # => { :b => "bear" }
short.to_h  # => { :a => "ant", :c => "cat" }
