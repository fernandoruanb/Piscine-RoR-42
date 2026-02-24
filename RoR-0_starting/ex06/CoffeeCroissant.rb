data = [
['Frank', 33],
['Stacy', 15],
['Juan' , 24],
['Dom' , 32],
['Steve', 24],
['Jill' , 24]
]

=begin
	The same logic as the another exercise I did, the H2o.rb, putting more organized
=end

myHash = Hash.new{ |h, v| h[v] = [] }

data.each do |name, age|
	myHash[age] << name
end

myHash.keys.sort.each do |age|
	myHash[age].sort.each do |name|
		puts "#{name}"
	end
end
myHash.clear
myHash = nil
