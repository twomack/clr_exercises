#!/usr/bin/ruby -w

require_relative 'lib/tuple_heap'

def merge_ordered_lists(lists)
  # Merged ordered lists is an algorithm to merge k sorted lists into one
  # sorted list of n total elements. The runtime for this algorithm is 
  # O(n*lg(k)). Note: the output of this algorithm will be reverse ordered 
  # from largest to smallest. I didn't feel like implementing a min-heap.

  # Create Heap of list max values - O(k+k) = O(k)
  max_vals = []
  (0...lists.length).each do |i| #create array of max values - O(k)
    list_max = lists[i].pop #lists are sorted; largest val is end of list
    if list_max != nil #list is empty
      max_vals.push([list_max, i]) #turn val into tuple with list index 
    end
  end
  max_heap = TupleHeap.new(max_vals) #create heap of max tuples - O(k)

  # Pull values out of max heap to create merged list - O(n*lg(k))
  merged_list = []
  max_tuple = max_heap.extract_max() #O(lg(k))
  while max_tuple != nil do #max_heap is not empty; loops n times
    list_index = max_tuple[1]
    merged_list.push(max_tuple[0])
    next_max = lists[list_index].pop #get next value from list
    if next_max != nil
      max_heap.insert([next_max, list_index]) #add next max - O(lg(k))
    end
    max_tuple = max_heap.extract_max() #get next max - O(lg(k))
  end

  return merged_list
end

def generate_rand_array(array_length, end_num, begin_num=1)
  return Array.new(array_length) { rand(begin_num..end_num) }        
end

def generate_sorted_lists(num_elements, end_num, num_lists)
  sorted_lists = []
  (0...num_lists).each do
    list = generate_rand_array(num_elements, end_num)
    sorted_lists.push(list.sort)
  end
  return sorted_lists
end

def print_array(array)
  puts array.inspect
end

def run_test(num_elements, end_num, num_lists)
  puts "TESTING MERGE ALGO ===================================================="
  lists = generate_sorted_lists(num_elements, end_num, num_lists)
  (0...num_lists).each do |i|
    print "List #{i}: "+lists[i].inspect+"\n"
  end
  merged_list = merge_ordered_lists(lists)
  print_array(merged_list)
end

run_test(5, 100, 2)
run_test(5, 100, 4)
run_test(5, 100, 8)
run_test(5, 100, 16)
run_test(5, 100, 32)
