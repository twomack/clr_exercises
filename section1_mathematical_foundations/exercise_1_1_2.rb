#!/usr/bin/ruby -w

def reverse_insertion_sort(array)
	(1...array.length).each do |j|
		key = array[j]
		# Inset array[j] into the sorted sequence array[1..j-1]
		i = j-1
		while (i >= 0) && (array[i] < key) do
			array[i+1] = array[i]
			i -= 1
		end
		array[i+1] = key
	end
	return array
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
	sorted_array = reverse_insertion_sort(array_to_be_sorted)
	print_array(sorted_array)
end

# Testing my function
run_test(5, 10)