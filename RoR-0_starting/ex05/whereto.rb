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
	That is the same challenge we have in the Piscine Python Django. I decided to solve that exercise
	organazing the code in two main functions to detect if the user input is a capital or a state,
	returning nil (our similar to None in Python and void in C/C++ languages) to indicate there is not that
	target being analyzing. If I match one of them, I get capital, state and state, all originals, and print
	on stdout. If I do not match anyone, I print nothing.
=end

def isCapital(capitals, states, capitalInput)
	for sigla, capital in capitals
		if (capital.downcase == capitalInput.downcase)
			for state, siglaState in states
				if siglaState == sigla
					return ([capital, state, sigla])
				end
			end
		end
	end
	return nil
end

def isState(capitals, states, stateInput)
	for state, sigla in states
		if (state.downcase == stateInput.downcase)
			return [capitals[sigla], state, sigla]
		end
	end
	return nil
end

if ARGV.length != 1
	exit(1)
end

listOfArgs = ARGV[0].split(",")
listOfArgs.each do |input|
	test = input.strip()
	if !test.nil?
		isValidState = isState(capitals_cities, states, test)
		isValidCapital = isCapital(capitals_cities, states, test)

		if isValidState.nil? && !isValidCapital.nil?
			puts("#{isValidCapital[0]} is the capital of #{isValidCapital[1]} (akr: #{isValidCapital[2]})")
		elsif isValidCapital.nil? && !isValidState.nil?
			puts("#{isValidState[0]} is the capital of #{isValidState[1]} (akr: #{isValidState[2]})")
		end
	end
end
