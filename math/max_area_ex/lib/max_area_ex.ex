defmodule MaxAreaEx do
  @moduledoc """
  Documentation for `MaxAreaEx`.
  You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

  Find two lines that together with the x-axis form a container, such that the container contains the most water.

  Return the maximum amount of water a container can store.

  Notice that you may not slant the container.
  """

  @doc """

  ## Examples

      iex> MaxAreaEx.max_area([1,8,6,2,5,4,8,3,7])
      49

      iex> MaxAreaEx.max_area([1,1])
      1

      iex> MaxAreaEx.max_area([4,3,2,1,4])
      16
  """
  def max_area([firs_height | heights]) do
    find_max_area(heights, 0, 2, [{firs_height, 1}])
  end

  defp find_max_area([], max_area, _, _), do: max_area

  defp find_max_area([c_height | heights], max_area, current_x, prev_heights) do
    new_area =
      Enum.reduce(prev_heights, max_area, fn {previous_height, previous_x}, max ->
        base = min(previous_height, c_height)
        area = base * (current_x - previous_x)
        max(max, area)
      end)

    find_max_area(heights, max(max_area, new_area), current_x + 1, [
      {c_height, current_x} | prev_heights
    ])
  end
end
