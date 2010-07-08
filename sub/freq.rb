require 'pp'

str = 'bhjuh nb uls vulru sl yx h onuunbw nuaxusnlu yjs swx rlkg nb onuunbw swxkx hkx dhuzdlkxbhjuhbnuonumhugswhuxmbxrwxkxluxbhjuhcxkxaxkzswkxxlkoljkcxlcmxonuubvulrrwhshbhjuhnbxmbxrwxkxnozljbxxhbnfubhjuhluswxgllkzljphuulsyxbjkxswhsswxkxnbhbhjuhyxwnugswxgllk'
key = 'fg|pc|cp|zy|dm|rw|xe|ha|un|bs|lo|ju|ni|st|of|ni|un|wh|vk|yb|av|ml|gd|kr'.split('|')
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
