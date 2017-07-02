#!/usr/bin/ruby -w

require_relative 'lib/heap'

my_array = [0, 2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
my_heap = Heap.new(my_array)
my_heap.print_heap_tree()

# First, test extract_max method
puts 'TESTING DELETE ====================================='
my_heap.delete(10)
my_heap.print_heap_tree()
puts '===================================================='
my_heap.delete(1) #testin moving down
my_heap.print_heap_tree()
puts '===================================================='
my_heap.delete(0)
my_heap.print_heap_tree()
puts '===================================================='
my_heap.delete(1)
my_heap.print_heap_tree()
puts '===================================================='
my_heap.insert(11)
my_heap.print_heap_tree()
puts '===================================================='
my_heap.insert(20)
my_heap.print_heap_tree()
puts '===================================================='
my_heap.insert(21)
my_heap.print_heap_tree()
puts '===================================================='
my_heap.insert(50)
my_heap.print_heap_tree()
puts '===================================================='
my_heap.delete(6) #testing moving up
my_heap.print_heap_tree()
