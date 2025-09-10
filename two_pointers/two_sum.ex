defmodule Solution do
  @spec two_sum(nums :: [integer], target :: integer) :: [integer]
  def two_sum(nums, target) do
    map = %{}
    find_sum_total(0, target, map, nums)
  end

  @spec opt_two_sum(nums :: [integer], target :: integer) :: [integer]
  def opt_two_sum([_hd | tail] = nums, target), do: opt_find_sum_total(nums, tail, 0, 1, target)

  defp find_sum_total(current_index, target, map, [hd | tail]) do
    searching_value = target - hd

    if Map.has_key?(map, searching_value) do
      [Map.get(map, searching_value), current_index]
    else
      map = Map.put(map, hd, current_index)
      find_sum_total(current_index + 1, target, map, tail)
    end
  end

  defp find_sum_total(_, _, _, []), do: []

  defp opt_find_sum_total([n1 | _], [n2 | _], index_1, index_2, target) when n1 + n2 == target,
    do: [index_1, index_2]

  defp opt_find_sum_total([], _, _, _, _), do: nil

  defp opt_find_sum_total(nums, [_ | other_nums], index_1, index_2, target),
    do: opt_find_sum_total(nums, other_nums, index_1, index_2 + 1, target)

  defp opt_find_sum_total([_ | [first_num | nums]], [], index_1, _index_2, target),
    do: opt_find_sum_total([first_num | nums], nums, index_1 + 1, index_1 + 2, target)
end
