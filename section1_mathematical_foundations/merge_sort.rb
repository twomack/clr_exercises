#!/usr/bin/ruby -w

def merge_sort(array, index_p, index_r)
  if index_p < index_r
    index_q = (index_p+index_r)/2
    merge_sort(array, index_p,   index_q)
    merge_sort(array, index_q+1, index_r)
    merge(array, index_p, index_q, index_r)
  end
end

def merge(array, index_p, index_q, index_r)
  tmp_array = array.dup
  index_i = index_p
  index_a = index_p #iterates over subarray index_p to index_q
  index_b = index_q+1 #iterates over subarray index_q+1 to index_r
  while index_i <= index_r do
    if (index_a <= index_q) && (index_b <= index_r)
      if tmp_array[index_a] < tmp_array[index_b]
        array[index_i] = tmp_array[index_a]
        index_a += 1
      else
        array[index_i] = tmp_array[index_b]
        index_b += 1
      end
    elsif index_a <= index_q
      array[index_i] = tmp_array[index_a]
      index_a += 1
    else #index_b <= index_r
      array[index_i] = tmp_array[index_b]
      index_b += 1
    end
    index_i += 1
  end
end

def generate_rand_array(array_length, end_num, begin_num=1)
  return Array.new(array_length) { rand(begin_num..end_num) }        
end

def print_array(array)
  puts array.inspect
end

def print_array_index(array, begin_i, end_i)
  puts array[begin_i..end_i].inspect
end

def run_test(length, end_range)
  puts "BEGIN TEST =========================================================="
  array_to_be_sorted = generate_rand_array(length, end_range)
  print_array(array_to_be_sorted)
  sorted_array = array_to_be_sorted.dup
  merge_sort(sorted_array, 0, sorted_array.length-1)
  print_array(sorted_array)
end

# Testing my function
run_test(8, 100)
