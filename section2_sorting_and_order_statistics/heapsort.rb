#!/usr/bin/ruby -w

#TODO - this should be turned into an object with a heap_size attribute;
#       do this for priority queue imlementation
$heap_size = 0

def print_array_as_heap(array, end_index)
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
    (0...end_index).each do |i|
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
    return $heap_size
end

def exchange(a, i, j)
    # exchange() exchanges the values of the elements at indexes i and j
    # of array a.
    tmp = a[i]
    a[i] = a[j]
    a[j] = tmp
end

def heapify(a, i)
    while i < heap_size(a) do #this condition will never break; see final else
        l = left(i) #get children node indexes
        r = right(i)

        # Calculate larget child node
        largest = i
        if (l < heap_size(a)) && (a[l] > a[i])
            largest = l
        end
        if (r < heap_size(a)) && (a[r] > a[largest])
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

def build_heap(a)
    # build_heap() is a bottoms-up procedure to create a heap out of an array
    # by running the heapify algorithm. This is an implementation of the 
    # psuedocode in section 7.3
    $heap_size = a.length
    (($heap_size-1)/2).downto(0) do |i| #start at highest index non-leaf node
        heapify(a, i)
    end
end

def heapsort(a)
    # heapsort() will sort the input array in place
    build_heap(a)
    (a.length-1).downto(1) do |i|
        exchange(a, 0, i)
        $heap_size -= 1
        heapify(a, 0)
    end
end

# Figure 7-3
# puts "build_heap Example 7.3:"
# test_array_bh = [4, 1, 3, 2, 16, 9, 10, 14, 8, 7]
# puts "Before:"
# print_array_as_heap(test_array_bh, test_array_bh.length)
# build_heap(test_array_bh)
# puts "After:"
# print_array_as_heap(test_array_bh, test_array_bh.length)

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