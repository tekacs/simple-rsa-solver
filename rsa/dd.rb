dd = []

1.upto(9999) do |n|
  s = n.to_s
  while s.size < 4
    s = '0' + s
  end
  if s.scan(/(\d).*\1/).size == 1
    if s.scan(/(\d).*\1.*\1/).size == 0
      dd << s
    end
  end
end

puts Marshal.dump(dd)
