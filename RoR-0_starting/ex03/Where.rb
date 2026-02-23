#!/usr/bin/env ruby
$VERBOSE = true

states = {
"Oregon" => "OR",
"Alabama" => "AL",
"New Jersey" => "NJ",
"Colorado" => "CO"
}

capitals_cities = {
"OR" => "Salem",
"AL" => "Montgomery",
"NJ" => "Trenton",
"CO" => "Denver"
}

=begin
	In that program, the user passes to us an argument and yes in Ruby ARGV[0] is not
	the name of the program as usually we see in Python and C/C++ languages. It is strange
	but Ruby is working well by this part.
	I made two functions, one to get the state and, one more time, we do not need to specif
	"return" in Ruby because the last value validated is automatically returned. If I do not have
	a value, the function returns "nil", our "None" similar in Python.

	If the state is unknown, then I sent the pattern message "Unknown state". Else, I put the match capital
	city as the subject shows us.
=end

if ARGV.length != 1
	exit 1
end

def getStateSigla(states, state)
	states[state]
end

def getCapitalBySigla(capitals, sigla)
	capitals[sigla]
end

sigla = getStateSigla(states, ARGV[0].strip)

if sigla.nil?
	puts "Unknown state"
	exit 0
end

puts(getCapitalBySigla(capitals_cities, sigla))
