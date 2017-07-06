module Common
  # Common module contains a number of simple, frequently used methods.

  module_function

  def exchange(a, i, j)
    # exchange() - method that exchanges array values at i, j
    tmp = a[i]
    a[i] = a[j]
    a[j] = tmp
  end
end