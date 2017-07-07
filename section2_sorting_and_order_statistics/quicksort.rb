#!/usr/bin/ruby -w

require_relative 'lib/test_sort'
require_relative 'lib/common'

def quicksort(a, p_index=0, r_index=a.length-1)
  # Implementation of quicksort psuedocode from section 8.1
  if p_index < r_index
    q_index = partition(a, p_index, r_index)
    quicksort(a, p_index, q_index)
    quicksort(a, q_index+1, r_index)
  end
end

def partition(a, p_index, r_index)
  # Implementation of partition psuedocode from section 8.1
  x = a[p_index]
  i = p_index-1
  j = r_index+1
  while true
    begin
      j-=1
    end until a[j] <= x
    begin
      i+=1
    end until a[i] >= x
    if i < j
      Common.exchange(a, i, j)
    else
      return j
    end
  end
end

def randomized_quicksort(a, p_index=0, r_index=a.length-1)
  # Implementation of randomized quicksort psuedocode from section 8.3
  if p_index < r_index
    q_index = randomized_partition(a, p_index, r_index)
    randomized_quicksort(a, p_index, q_index)
    randomized_quicksort(a, q_index+1, r_index)
  end
end

def randomized_partition(a, p_index, r_index)
  # Implementation of randomized partition psuedocode from section 8.3
  i = Common.random_range(p_index, r_index) #random numer p to r, inclusive
  Common.exchange(a, p_index, i)
  return partition(a, p_index, r_index)
end

TestSort.run_test(method(:quicksort), 15, 50)
TestSort.run_test(method(:randomized_quicksort), 15, 50)