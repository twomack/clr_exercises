#!/usr/bin/ruby -w

def print_array_as_heap(array)
	# print_array_as_heap() is a crude funcion for printing an array like a 
	# heap. Each element will be printed with its index in the array, like so:
	#
	#     input - [21, 15, 13, 10, 18, 12, 1, 13]
	#
	#     output below:
	#     21(1)
	#     15(2) 13(3)
	#     10(4) 18(5) 12(6) 1(7)
	#     13(8)
	#
	# This will not work for large heaps. This is mostly meant for small debug.
	pow_2 = 0 #keeps track of heap level
	pow_2_index = 0 #index inside the heap level
	for i in 0...array.length
		print array[i],'(',i,')', ' ' #array_element(i)
		if pow_2_index == 2**pow_2-1 #decide if we need to incres heap level 
			print "\n"
			pow_2_index = 0
			pow_2 += 1 
		else
        	pow_2_index += 1
		end
	end
	print "\n"
end

def left(i)
	# left() gets the left child index for a node index in the heap. This would
	# normally be implemented as a macro.
	return (i<<1)+1
end

def right(i)
	# right() gets the right child index for a node index in the heap. This 
	# would normally be implemented as a macro.
	return (i<<1)+2
end

def heap_size(a)
	# heap_size just returns the length of the array (which is not quite right,
	# but a simplification). We use a function here to resemble the psuedocode.
	return a.length
end

def exchange(a, i, largest)
	# exchange() exchanges the values of the elements at indexes i and largest
	# of array a.
	tmp = a[i]
	a[i] = a[largest]
	a[largest] = tmp
end


def heapify_recursive(a, i)
	# heapify_recursive() is a recursive implementation of the heapify
	# algorithm. This is an implementation of the algorithm psuedocode in
	# Section 7.2.
	l = left(i) #get children node indexes
	r = right(i)

	# Calculate largest child node
	largest = i #ASSUMPTION: i is less than array.length
	if (l < heap_size(a)) && (a[l] > a[i])
		largest = l
	elsif (r < heap_size(a)) && (a[r] > a[largest])
		largest = r
	end
	
	# Determine if done, else exchange child and parent node values
	if largest != i
		exchange(a, i, largest)
		heapify_recursive(a, largest)
	end
end

def heapify_iterative(a, i)
	# heapify_iterative() is an iterative implementation of the heapify
	# algorithm.
	while i < heap_size(a) do #this condition will never break; see final else
		l = left(i) #get children node indexes
		r = right(i)

		# Calculate larget child node
		largest = i
		if (l < heap_size(a)) && (a[l] > a[i])
			largest = l
		elsif (r < heap_size(a)) && (a[r] > a[largest])
			largest = r
		end

		# Determine if done, else exchange child and parent node values
		if largest != i
			exchange(a, i, largest)
			i = largest
		else
			break
		end
	end		
end

# Figure 7-2 from CLR using recursive function
puts "Using recursive heapify function..."
test_array_recursive = [16, 4, 10, 14, 7, 9, 3, 2, 8, 1]
puts "Before:"
print_array_as_heap(test_array_recursive)
heapify_recursive(test_array_recursive, 1)
puts "After:"
print_array_as_heap(test_array_recursive)

#  Using iterative function
puts "\nUsing iterative heapify function..."
test_array_iterative = [16, 4, 10, 14, 7, 9, 3, 2, 8, 1]
puts "Before:"
print_array_as_heap(test_array_iterative)
heapify_iterative(test_array_iterative, 1)
puts "After:"
print_array_as_heap(test_array_iterative)