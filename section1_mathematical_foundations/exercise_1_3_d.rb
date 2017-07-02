#!/usr/bin/ruby
require 'benchmark'

def compute_inverstions(input_array)
  cpy = Array.new(input_array)
  count = merge_sort_count(cpy, 0, cpy.length-1)
  return count
end

def merge_sort_count(array, index_p, index_r)
  inversion_count = 0
  if index_p < index_r
    index_q = (index_p+index_r)/2
    count_1 = merge_sort_count(array, index_p,   index_q)
    count_2 = merge_sort_count(array, index_q+1, index_r)
    merge_count = merge(array, index_p, index_q, index_r)
    inversion_count = count_1 + count_2 + merge_count
  end
  return inversion_count
end

def merge(array, index_p, index_q, index_r)
  tmp_array = array.dup
  index_i = index_p
  index_a = index_p  #iterates over subarray index_p to index_q
  index_b = index_q+1  #iterates over subarray index_q+1 to index_r
  inversion_count = 0
  while index_i <= index_r do
    if (index_a <= index_q) && (index_b <= index_r)
      if tmp_array[index_a] <= tmp_array[index_b]  #don't need to add
        array[index_i] = tmp_array[index_a]
        index_a += 1
      else
        array[index_i] = tmp_array[index_b]
        inversion_count += (index_b - index_i)
        index_b += 1
      end
    elsif index_a <= index_q  #don't need to add
      array[index_i] = tmp_array[index_a]
      index_a += 1
    else  #index_b <= index_r; don't need to add
      array[index_i] = tmp_array[index_b]
      index_b += 1
    end
    index_i += 1
  end
  return inversion_count
end

def compute_inversions_gold(input_array)
  array_final_ind = input_array.length
  num_inversions = 0
  (0...array_final_ind).each do |i|
    (i+1...array_final_ind).each do |j|
      if input_array[j] < input_array[i]
        num_inversions += 1
      end
    end
  end
  return num_inversions
end

def generate_rand_array(array_length, end_num, begin_num=1)
  return Array.new(array_length) { rand(begin_num..end_num) }        
end

def print_array(array)
  puts array.inspect
end

def run_test(length, end_range)
  puts 'BEGIN TEST =========================================================='
  array = generate_rand_array(length, end_range)
  print_array(array)
  num_inversions_gold = 0
  gold_time = Benchmark.measure do
    num_inversions_gold = compute_inversions_gold(array)
  end
  num_inversions = 0
  my_time = Benchmark.measure do
    num_inversions = compute_inverstions(array)
  end        
  puts "Golden array inversions count: #{num_inversions_gold}"
  puts "Golden array time:             #{gold_time}"
  puts "My algorithm:                  #{num_inversions}"
  puts "My time:                       #{my_time}"
end

def run_test_directed(array)
  puts 'BEGIN TEST =========================================================='
  print_array(array)
  num_inversions_gold = compute_inversions_gold(array)
  my_inversions = compute_inverstions(array)
  puts "Golden array inversions count: #{num_inversions_gold}"
  puts "My algorithm:                  #{my_inversions}"
end

# run tests
run_test(20000, 100)
run_test_directed([5, 2, 4, 6, 1, 3, 2, 6])
