#!/usr/bin/env ruby
$VERBOSE = true

#properties = Hash.new{ |h, v| h[v] = [] }
input = nil

=begin
	To solve that problem, we need to learn how to create long strings in Ruby, using heredoc format
	and join (the join is normally as we did in all the other exercises with #{}) the tables.
	First step, we need to open the target file and extract each line. For each line extracted, I need to
	separate the elements and their characteristics, storing in a Hash to check each char. Then, I mount the
	table of the target element and store in my input.
	After everything, I add in my html and write in my output file
	
=end

File.open("periodic_table.txt", "r") do |myPeriodicTable|
	periodicTable = myPeriodicTable.read
	tables = periodicTable.each_line do |line|
		properties = {}
		element, chars = line.split("=", 2) # Break the line into two parts
		chars.strip.split(",").each do |pair| # to start to get each element
			k, v = pair.split(":", 2) # key and value
			properties[k.strip] = v.strip # clean spaces, newlines and etc
		end
		elementName = element
		elementAtomicNumber = properties["number"]
		elementIcon = properties["small"]
		elementMolar = properties["molar"]
		elementElectron = properties["electron"]
		doc = <<~HTML
			<table>
				<tr>
					<td style="border: 1px solid black; padding:10px">
						<h4>#{elementName}</h4>
						<ul>
							<li>No #{elementAtomicNumber}</li>
							<li>#{elementIcon}</li>
							<li>#{elementMolar}</li>
							<li>#{elementElectron} electron</li>
						</ul>
					</td>
				</tr>
			</table>
		HTML
		input = "" if input.nil?
		input << doc
	end
end

html = <<~HTML
	<!DOCTYPE html>
	<html lang=en>
		<head>
			<meta charset="utf-8">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<meta name="author" content="Fernando Ruan">
			<title>My Periodic Table</title>
		</head>
		<body>
			#{input}
		</body>
	</html>
HTML

File.open("periodic_table.html", "w") do |myOutput|
	myOutput.write(html)
end
