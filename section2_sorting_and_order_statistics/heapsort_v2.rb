#!/usr/bin/ruby -w

require_relative 'lib/heap'

def heapsort(a)
  # heapsort() will sort the input array using a heap
  heap_a = Heap.new(a)
  (heap_a.heap_size-1).downto(1) do |i|
    heap_a.exchange(0, i)
    heap_a.heap_size -= 1
    heap_a.heapify(0)
  end
end

def generate_rand_array(array_length, end_num, begin_num=1)
  return Array.new(array_length) { rand(begin_num..end_num) }        
end

def print_array(array)
  puts array.inspect
end

def run_test(length, end_range)
  puts "BEGIN TEST =========================================================="
  array_to_be_sorted = generate_rand_array(length, end_range)
  print_array(array_to_be_sorted)
  heapsort(array_to_be_sorted)
  print_array(array_to_be_sorted)
end

# Testing my function
run_test(10, 25)
