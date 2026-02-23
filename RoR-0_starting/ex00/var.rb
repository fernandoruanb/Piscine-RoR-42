#!/usr/bin/env ruby
$VERBOSE = true

=begin
	The $VERBOSE turns on warnings, but, we can also run the code "ruby -w your_file.rb".
	However, in my opinion, turns on the $VERBOSE is the best choice to accomplish to the subject.
	We must need specify the interpreter to use by a shebang, the subject askes for it.
=end

vars = [
	10,
	10,
	nil,
	10.0
]

=begin
	I made a list of vars to make that exercise more easy to be solved.
	A list in Ruby can be accessed with the respective index.
	The "|" represents a block, I received two values and I named them by var and i, variable
	and index.
	The casting in Ruby can be done using .chr
	
	However, that format can print incorrect chars. Then, to correct it, I am using a counter putting the first
	letter and using the .succ to continue. If we finish all letters, it returns aa, ab, ac and etc. If we want
	only one varible I can use only vars.each and not vars.each_with_index that returns the var and also index

	What is "nil". Do you remember "None" in Python language? It is the same. "nil" represents the empty, 
	the absense of value.
=end

counter = "a"

vars.each do |var|
	puts "#{counter} contains: #{var.inspect} and is a type: #{var.class}"
	counter = counter.succ
end
