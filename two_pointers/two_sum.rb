# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  index_a = 0
  index_b = 1
  searching = true

  while searching && index_a < nums.length - 1
    while searching && index_b < nums.length
      if nums[index_a] + nums[index_b] == target
        searching = false
      else
        index_b += 1
      end
    end

    if searching
      index_a += 1
      index_b = index_a + 1
    end
  end

  [index_a, index_b]
end

def opt_two_sum(nums, target)
  hash_map = {}

  (0..nums.length).each do |index_b|
    value_b = nums[index_b]
    searching_value = target - value_b

    return [hash_map.fetch(searching_value), index_b] if hash_map.key?(searching_value)

    hash_map[value_b] = index_b
  end
end
