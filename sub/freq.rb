#!/usr/bin/env ruby

# Simple substitution cipher helper.

str = ARGV[0]
key = 'ab|bc|et|ce|te|ra'.split('|')
map = Hash.new
key.each do |pair|
	a, b = pair.split('')
	map[a] = b
end
pp map.sort_by { |k,v| v }
str.split('').each do |c|
	if map.has_key?(c)
		print map[c].upcase
	else
		print c
	end
end
puts
