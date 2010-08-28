#!/usr/bin/env ruby
require 'yaml'
require 'rsaenc'

params = YAML::load(File.open(ARGV[0]).read)
n = params['n']
e = params['e']
m = params['m']
conv = params['conv']

puts rsaenc(n, e, m, conv).join(' ')
