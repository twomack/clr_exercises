class Heap

  attr_accessor :heap_size, :heap_array

  def initialize(a)
    # initialize() - the constructor method is an implementation of the
    #                canonical build_heap function as described in section 7.3
    #
    # Heap tree structure: a[parent] > a[left_child], a[right_child]; see below
    #             a[0]
    #         /         \
    #       a[1]        a[2]
    #      /    \      /    \
    #    a[3]   a[4] a[5]   a[6] etc...
    @heap_array = a
    @heap_size = @heap_array.length
    ((@heap_size-1)/2).downto(0) do |i|
        heapify(i)
    end
  end

  def heapify(i)
    # heapify() - implementation of the canonical heapify function as described
    #             in section 7.2; pushes the element at location i to its
    #             correct location in the heap sub-tree rooted at i
    while i < @heap_size do #this condition will never break; see final else
      l = left(i) #get children node indexes
      r = right(i)

      # Calculate larget child node
      largest = i
      if (l < @heap_size) && (@heap_array[l] > @heap_array[i])
        largest = l
      end
      if (r < @heap_size) && (@heap_array[r] > @heap_array[largest])
        largest = r
      end

      # Determine if done, else exchange child and parent node values
      if largest != i
        exchange(i, largest)
        i = largest
      else
        break
      end
    end   
  end

  def maximum()
    # maximum() - returns largest element in heap; by definition, this is
    #             located at index 0
    return @heap_array[0]
  end

  def extract_max()
    # extract_max() - returns largest element in heap and also removes it from
    #                 the heap
    if @heap_size == 0 #heap is empty; return nil
      return nil
    end
    max = maximum() #store maximum value in tmp variable to be returned
    @heap_array[0] = @heap_array[@heap_size-1] #move last element to root
    heap_pop()
    heapify(0) #pushes last element to correct heap location
    return max
  end

  def insert(key)
    # insert() - inserts a new value into the heap at correct position
    last = @heap_size #iterate from last leaf node
    heap_push(key)
    sift(last, key) #move key up tree to its proper position in heap
  end

  def increase_key(i, k)
    # increase_key() - sets heap_array[i] to max(heap_array[i], k) and updates
    #                  heap_structure accordingly in O(lg(n)) time. Implemented
    #                  as part of exercise 7.5-4
    if @heap_array[i] < k #only excecute if k is larger
        sift(i, k) #move k up tree to its proper position in heap
    end
  end

  def delete(i)
    # delete() - deletes the element at index i and readjusts the heap to
    #            account for missing element in O(lg(n)). Implemented as part of
    #            exercise 7.5-5
    if i >= @heap_size
      raise IndexError
    end
    last = heap_pop()
    if i < heap_size #if we deleted last element, return immediately
      # Determine if new value needs to move up heap
      if (i > 0) && (last > @heap_array[parent(i)])
        sift(i, last)
      else #push element down the heap
        @heap_array[i] = last
        heapify(i)
      end
    end
  end

  def exchange(i, j)
    # exchange() - helper method that exchanges array values at i, j; only
    #              public for heapsort implementation
    tmp = @heap_array[i]
    @heap_array[i] = @heap_array[j]
    @heap_array[j] = tmp
  end

  def print_heap_tree()
    # print_heap_tree() is a crude funcion for printing an array like a 
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
    (0...@heap_size).each do |i|
        print @heap_array[i],'(',i,')', ' ' #array_element(i)
        if pow_2_index == 2**pow_2-1 #decide if we need to incres heap level 
            if i < (@heap_size-1)
              print "\n"
            end
            pow_2_index = 0
            pow_2 += 1 
        else
            pow_2_index += 1
        end
    end
    print "\n"
  end

  private #=====================================================================

  def heap_pop()
    # heap_pop() - private helper method that pops the last element off the
    #              heap_array and decrements heap_size
    @heap_size -= 1
    return @heap_array.pop
  end

    def heap_push(k)
    # heap_push() - private helper method that pushes k to end of array_heap
    #               and increments heap_size
    @heap_size += 1
    @heap_array.push(k)
  end

  def sift(i, k)
    # sift() - private helper method that sifts a value k to where its proper
    #          position in heap sub-tree is between the root and node i
    while (i > 0) && (@heap_array[parent(i)] < k) do
      @heap_array[i] = @heap_array[parent(i)] #move parent value down heap
      i = parent(i)
    end
    @heap_array[i] = k #correct position in heap sub-tree found
  end

  def parent(i)
    # parent() - private helper method to caculate parent node index of child i;
    #            see initialize() method for tree description
    return (i-1)/2
  end

  def left(i)
    # left() - private helper method to caculate left child index of parent i;
    #          see initialize() method for tree description
    return (i<<1)+1
  end

  def right(i)
    # right() - private helper method to caculate right child index of parent i;
    #           see initialize() method for tree description
    return (i<<1)+2
  end

end
