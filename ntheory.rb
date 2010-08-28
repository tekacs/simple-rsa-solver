#!/usr/bin/env ruby

module NTheory
  # Arbitrary totient calculation stuff...

  def self.gcd(a, b)
    a, b = b, a unless a > b
    while b != 0
      t = b
      b = a % b
      a = t
    end
    a
  end

  def self.coprime(a, b)
    gcd(a, b) == 1
  end

  def self.totient(a)
    tot = 1
    even = (a % 2) == 0
    2.upto(a) do |n|
      unless (even and (n%2) == 0)
        if coprime(a, n)
          tot += 1
        end
      end
    end
    tot
  end
  
  # For the calculation of modular multiplicative inverses.
  
  def self.egcd(a, b)
    a, b = b, a unless a > b
    x, y = 0, 1
    last_x, last_y = 1, 0
    while b != 0
      quotient = a/b

      t = b
      b = a % b
      a = t
    
      t = x
      x = last_x - quotient*x
      last_x = t
    
      t = y
      y = last_y - quotient*y
      last_y = t
    end
    [last_x, last_y, a]
  end

  def self.fprime(n) # Factorise the product of two primes.
    p = Prime.new
    sqrt = n**0.5
    f = 0
    while f < sqrt
      f = p.next
      if (n % f) == 0
        return [f, n/f]
      end
    end
    [1, n]
  end

  def self.modexp(base, exp, mod)
    result = 1
    while (exp > 0)
      unless ((exp % 2) == 0)
        result = (result * base) % mod
      end
      exp >>= 1
      base = (base * base) % mod
    end
    result
  end
  
  def self.handexp(base, exp, mod)
    e = 1
    x = base
    result = 1
    while e < exp
      if ((e & exp) != 0)
        result *= x
      end
      x = (x*x)%mod
      e <<= 1
    end
    result % mod
  end
end

class Prime
  def initialize(n=1)
    @last = n
  end

  def Prime.prime?(n)
    k = 25
    return true if n == 2
    return false if n == 1 || (n % 2) == 0
    d = n - 1
    d >>= 1 while (d % 2) == 0
    
    k.times do
      a = rand(n - 4) + 2
      t = d
      x = NTheory.modexp(a, t, n)
      next if x == 1 || x == n - 1
      while (t != n - 1) && (x != n - 1) && (x != 1)
        x = (x * x) % n
        t <<= 1
      end
      return false if (x != n - 1) && ((t % 2) == 0)
    end
    return true
  end

  def next
    hardcode = [2, 3]
    if @last < 3
      @last = hardcode[@last - 1]
    else
      loop do
        @last += 2
        break if Prime.prime?(@last)
      end
    end
    return @last
  end
end
