require 'debug'

class Merge
  # O(n log n)
  def self.merge_sort(arr) # O(log n)
    return arr if arr.length < 2

    # Divide and Conquer
    middle_index = (arr.length / 2).floor
    left_arr = arr.slice(0..middle_index - 1)
    right_arr = arr.slice(middle_index..arr.length)

    merge(merge_sort(left_arr), merge_sort(right_arr)) # O(n)
  end

  # O(n)
  def self.merge(left_arr, right_arr)
    result = []
    left_index = 0
    right_index = 0

    while left_index < left_arr.length && right_index < right_arr.length
      if left_arr[left_index] < right_arr[right_index]
        result << left_arr[left_index]
        left_index += 1
      else
        result << right_arr[right_index]
        right_index += 1
      end
    end

    result.concat(left_arr[left_index..]).concat(right_arr[right_index..])
  end
end
