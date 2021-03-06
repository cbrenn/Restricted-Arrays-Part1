require_relative 'restricted_array.rb'
# RestrictedArray can be created using a specified size, or a random size in
# the range of 1-20 will be chosen for you.
# All values are integers in the range of 1-221.
# RestrictedArray cannot be resized.

# Calculates the length of the restricted array. All values are integers.
# The restricted_array is terminated by 'nil' i.e. array[length] = nil
def length(array)
  i = 0
  until array[i] == nil
    array[i]
    i+=1
  end
  length = i
  return length
end

# Prints each integer values in the array
def print_array(array)
  printed_array = []
  until array[i] ==nil
    printed_array << array[i]
  end
  print printed_array
end

# For an unsorted array, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def search(array, length, value_to_find)
  i = 0
  until array[i] == nil
    return true if array[i] == value_to_find
    i+=1
  end
  return false
end

# Finds and returns the largest integer value the array
# Assumes that the array is not sorted.
def find_largest(array, length)
  i = 0
  max = array[i]
  while array[i] != nil
    array[i] > max ? max = array[i] : max = max
    i += 1
  end

  return max
end

# Finds and returns the smallest integer value in the array
# Assumes that the array is not sorted.
def find_smallest(array, length)
  i = 0
  min = array[i]
  while array[i] != nil
    array[i] < min ? min = array[i] : min = min
    i += 1
  end
  return min
end

# Reverses the values in the integer array in place
def reverse(array, length)
  # max = array[i]
  # min = array[i]
  i = 0
  j = 0
  temp = 0
  while i < length/2
    begins = array[i]
    ends = array[length-1-j]
    temp = begins
    array[i] = ends
    array[length-1-j] = temp
    temp = 0

    i +=1
    j +=1
  end
  return array




end

# For an array sorted in ascending order, searches for 'value_to_find'.
# Returns true if found, false otherwise.
def binary_search(array, length, value_to_find)
  midpoint = (length-1)/2
  bottom = 0
  top = length-1
  n = 1
  return true if value_to_find == array[top]
  return true if value_to_find == array[bottom]

  while n < length/(2*n)
    #refactoring after this point became more confusing for the reader than efficient for the compiler
      return true if array[midpoint] == value_to_find

      #redefine midpoint if it is not the value to find
      midpoint = midpoint + (top - bottom)/2
      #if value to find is greater or less than midpoint
      #reassign top and bottom
      value_to_find > midpoint ? (top = midpoint + (top-bottom)/2; bottom = midpoint; n+=1)
      #less than midpoint
      : (bottom = midpoint - (top-bottom)/2;
      top = midpoint;
      n+=1)
      #
    end
    return false if n > length/(2*n)



end


# Helper method provided to sort the array in ascending order
# Implements selection sort
# Time complexity = O(n^2) since to find the correct value to be in a given location,
# all the remaining elements are visited. This is done for each location.
# (nested loop of size n each)
# Space complexity = O(1) since the additional storage needed does not depend
#                    on input array size.
def sort(array, length)
  length.times do |index| # outer loop - n elements
    min_index = index # assume index is where the next minimally value is
    temp_index = index+1 # compare with values at index+1 to length-1
    while temp_index < length # inner loop - n-1 elements
      if array[temp_index] < array[min_index] # found a new minimum, update min_index
        min_index = temp_index
      end
      temp_index += 1 # move to next index
    end
    if min_index != index # next minimum value is not at current index, swap
      temp = array[min_index]
      array[min_index] = array[index]
      array[index] = temp
    end
  end
end
## --- END OF METHODS ---
