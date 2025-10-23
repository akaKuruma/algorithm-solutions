defmodule MaxAreaOptEx do
  @moduledoc """
  Documentation for `MaxAreaOptEx`.
  You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

  Find two lines that together with the x-axis form a container, such that the container contains the most water.

  Return the maximum amount of water a container can store.

  Notice that you may not slant the container.
  """

  @doc """

  ## Examples

      iex> MaxAreaOptEx.max_area([1,8,6,2,5,4,8,3,7])
      49

      iex> MaxAreaOptEx.max_area([1,1])
      1

      iex> MaxAreaOptEx.max_area([4,3,2,1,4])
      16
  """
  def max_area(height) do
    right = length(height) - 1

    height
    |> List.to_tuple()
    |> find_max(0, right, 0)
  end

  def find_max(_, left, right, max) when left == right, do: max

  def find_max(height, left, right, max) do
    left_height = elem(height, left)
    right_height = elem(height, right)

    container_height = min(left_height, right_height)
    container_base = right - left
    container_area = container_height * container_base
    new_max = max(container_area, max)

    if left_height >= right_height,
      do: find_max(height, left, right - 1, new_max),
      else: find_max(height, left + 1, right, new_max)
  end
end
