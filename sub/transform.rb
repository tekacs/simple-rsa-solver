#!/usr/bin/env ruby

# Simple affine cipher helper.

str = ARGV[0]
map = Hash.new
a = 4
b = 7
alphabet = (97..(97+25)).map { |n| n.chr }
(0..25).each do |n|
	map[n] = ((a*n + b) % 26)
end
str.split('').each do |c|
	print((map[alphabet.index(c)]+97).chr)
end
puts
