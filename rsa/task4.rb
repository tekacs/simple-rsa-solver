require 'rsaenc'

def enc(m)
  rsaenc(4708819, 62311, m, false)
end
