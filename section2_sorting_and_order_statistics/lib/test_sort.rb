module TestSort
  # TestSort module contains a number of methods useful for testing sorting
  # functions.

  module_function

  def generate_rand_array(array_length, end_num, begin_num=1)
    return Array.new(array_length) { rand(begin_num..end_num) }        
  end

  def print_array(array)
    puts array.inspect
  end

  def run_test(sort_method, length, end_range)
    puts "BEGIN TEST =========================================================="
    array_to_be_sorted = generate_rand_array(length, end_range)
    print_array(array_to_be_sorted)
    sort_method.call(array_to_be_sorted)
    print_array(array_to_be_sorted)
  end
end