#!/usr/bin/env ruby
$VERBOSE = true

data = [['Caleb' , 24],
['Calixte' , 84],
['Calliste', 65],
['Calvin' , 12],
['Cameron' , 54],
['Camil' , 32],
['Camille' , 5],
['Can' , 52],
['Caner' , 56],
['Cantin' , 4],
['Carl' , 1],
['Carlito' , 23],
['Carlo' , 19],
['Carlos' , 26],
['Carter' , 54],
['Casey' , 2]]

=begin

It is necessary because in the start our Hash is empty. If the key does not exist, we create a pattern empty
h -> represents our Hash, the "myHash" and k represents the key we tried to use
It avoids "nil" in our Hash

One important information, Ruby has Garbage Collector. It means we do not need to free everything

One trap is 
bad = Hash.new([]) -> where is the key?
We need to create an array with a key to access it after
So, the pattern is { |h, k| h[k] = [] }
Then, it can work well

=end

myHash = Hash.new{ |h, k| h[k] = [] }

# To accomplish that exercise, we need only to do the conversion '-'

data.each do |name, age|
	myHash[age] << name.strip()
	puts "#{age} : #{name}"
end

=begin
	The next step is to order our Hash. What do we need to do? First, we need
	to order by the age and if we have people with the same age, we must need to order
	by their names alphabetically. To do it, first, we access the keys and use the sort() method
	to order each one by the age. The second step is to access the value by the key and order by name.
	Finally, we have the age and also the name. We print in the output "age : name" that the subject asked
=end

=begin
myHash.keys.sort.each do |age|
	myHash[age].sort.each do |name|
		puts "#{age} : #{name}"
	end
end
=end

myHash.clear # clean everything I put there
myHash = nil # if we want to call the Garbage Collector in a manual way
