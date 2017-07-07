module Common
  # Common module contains a number of simple, frequently used methods.

  module_function

  def exchange(a, i, j)
    # exchange() - method that exchanges array values at i, j
    tmp = a[i]
    a[i] = a[j]
    a[j] = tmp
  end

  def random_range(a, b)
    # random_range() - method that returns random # between a and b, inclusive
    return rand(b-a+1)+a
  end
end