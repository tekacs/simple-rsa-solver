#!/usr/bin/env ruby
require 'ntheory'

def rsaenc(n, e, m, conv)
  result = []
  if conv
    m = m.split('').map {|i| i[0]}
  else
    m = m.split(' ').map {|i| i.to_i}
  end
  m.each do |w|
    result << NTheory.modexp(w, e, n)
  end
  return result
end
