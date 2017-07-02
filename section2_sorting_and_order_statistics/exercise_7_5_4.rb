#!/usr/bin/ruby -w

require_relative 'lib/heap'

my_array = [0, 2, 4, 6, 8]
my_heap = Heap.new(my_array)
my_heap.print_heap_tree()

# First, test maximum method
puts 'TESTING MAXIMUM ===================================='
puts my_heap.maximum()

# Test extract_max method
puts 'TESTING EXTRACT_MAX ================================'
puts my_heap.extract_max()
puts '===================================================='
puts my_heap.extract_max()
puts '===================================================='
puts my_heap.extract_max()
puts '===================================================='
puts my_heap.extract_max()
puts '===================================================='
puts my_heap.extract_max()
puts '===================================================='
puts my_heap.extract_max()

# Test insert method
puts 'TESTING INSERT ====================================='
my_heap.insert(4)
my_heap.print_heap_tree()
puts '===================================================='
my_heap.insert(2)
my_heap.print_heap_tree()
puts '===================================================='
my_heap.insert(8)
my_heap.print_heap_tree()
puts '===================================================='
my_heap.insert(6)
my_heap.print_heap_tree()
puts '===================================================='
my_heap.insert(0)
my_heap.print_heap_tree()
puts '===================================================='
my_heap.insert(5)
my_heap.print_heap_tree()
puts '===================================================='
my_heap.insert(9)
my_heap.print_heap_tree()
puts '===================================================='
my_heap.insert(1)
my_heap.print_heap_tree()
puts '===================================================='
my_heap.insert(3)
my_heap.print_heap_tree()

# Test increase_key method
puts 'TESTING INCREASE_KEY================================'
my_heap.increase_key(0, 10)
my_heap.print_heap_tree()
puts '===================================================='
my_heap.increase_key(2, 6) #6 < 8; nothing should happen
my_heap.print_heap_tree()
puts '===================================================='
my_heap.increase_key(8, 11)
my_heap.print_heap_tree()
puts '===================================================='
my_heap.increase_key(5, 6)
my_heap.print_heap_tree()
