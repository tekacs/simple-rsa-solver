#!/usr/bin/env ruby
require 'yaml'
require 'ntheory'
require 'benchmark'

input = File.open(ARGV[0]).read
params = YAML::load(input)
n = params['n']
e = params['e']
c = params['c'].chomp
ascii = params.has_key?('ascii') && params['ascii']
doloop = params.has_key?('loop') && params['loop']

puts "Time taken: " + Benchmark.measure {

p, q = NTheory.fprime(n)

tot = (p - 1)*(q - 1)

#d = NTheory.modexp(e, NTheory.totient(tot)-1, tot)
d = NTheory.egcd(tot, e)[1] % tot
#d = -1
#1.upto(tot) do |i|
#  if (((e*i)-1) % tot) == 0
#    d = i
#    break
#  end
#end

puts "N: #{n}"
puts "E: #{e}"
puts "C: #{c}"
puts "Converting: #{ascii}"
puts "DoLoop: #{doloop}"
puts "P, Q = #{p}, #{q}"
puts "Totient: #{tot}"
puts "D: #{d}"

words = c.split(' ')
firstloop = true
result = nil # take scope out of loop.
loop do
  unless firstloop
    n, e = result.map {|i| i.to_i}
    puts "N: #{n}"
    puts "E: #{e}"
  end
  
  result = []
  words.each do |w|
    ans = NTheory.modexp(w.to_i, d, n)
    if ascii
      result << ans.chr
    else
      result << ans.to_s
    end
  end
  if ascii
    puts result.join('')
  else
    puts result.join(' ')
  end
  firstloop = false
  unless ((result[0].to_s.size != 2) and (result[1].to_s.size != 2) and doloop)
    break
  end
end
}.to_s.scan(/\((.*)\)/)[0][0].strip + " seconds"
