require_relative 'heap'

class TupleHeap < Heap
  # TupleHeap is a subclass of Heap that uses Tuples for the Heap nodes. The
  # value of the Heap for ordering should be kept in index 0. See val override
  # below.

  private 

  def val(heap_element)
    # heap_element() - protected helper method meant to be overriden by child
    #                  classes
    return heap_element[0]
  end

end
