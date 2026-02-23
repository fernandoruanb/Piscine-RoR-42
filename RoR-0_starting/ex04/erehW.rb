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
	That program does the opposite that the last did. We get a capital and
	we return the correspondent state. I use the same logic only change to the
	oppossite order
=end

def getCapitalSigla(capitals, capitalInput)
	for sigla, capital in capitals
		if (capital == capitalInput)
			return sigla
		end
	end
	return (nil)
end

def getStateBySigla(states, siglaInput)
	for state, sigla in states
		if (sigla == siglaInput)
			return state
		end
	end
	return (nil)
end

if ARGV.length != 1
	exit(1)
end

sigla = getCapitalSigla(capitals_cities, ARGV[0].strip())
if sigla.nil?
	puts "Unknown capital city"
	exit(0)
end
puts(getStateBySigla(states, sigla))
