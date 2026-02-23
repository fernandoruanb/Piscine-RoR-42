#!/usr/bin/env ruby
$VERBOSE = true

=begin
	Comparing the manner to open a file in Ruby and in Python, we use the same function "open"
	indicating the name of the file, extracting the content with .read and we can iterate with
	the target file by the same way we did in the last exercise only putting another step as the
	split.

	Then, myNumbers.split(",").each filters and also capture one value, one block, where we can
	put a name specified, I put "beautifulNumber". Finally, I print the value without the comma and using
	the strip() method to clean spaces, newlines, mess in the number.
=end

File.open("numbers.txt", "r") do |mySexyFile|
	myNumbers = mySexyFile.read
	myNumbers.split(",").each do |beautifulNumber|
		puts beautifulNumber.strip()
	end
end
