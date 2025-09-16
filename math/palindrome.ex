defmodule Solution do
  @spec is_palindrome(x :: integer) :: boolean
  def is_palindrome(x) when is_integer(x) and x < 0, do: false
  def is_palindrome(x) when is_integer(x) and x > 0 and x < 10, do: true

  def is_palindrome(x) do
    x
    |> Integer.digits()
    |> palindrome?([])
  end

  defp palindrome?(left_segment, right_segment)
       when length(left_segment) == length(right_segment),
       do: equal_sides?(left_segment, right_segment)

  defp palindrome?([_hd | left_segment], right_segment)
       when length(left_segment) == length(right_segment),
       do: equal_sides?(left_segment, right_segment)

  defp palindrome?([_first_left | []], _right_segment), do: false

  defp palindrome?([first_left | left_segment], right_segment),
    do: palindrome?(left_segment, [first_left] ++ right_segment)

  defp equal_sides?([], []), do: true

  defp equal_sides?([left_elem | left_tail], [right_elem | right_tail])
       when left_elem == right_elem,
       do: equal_sides?(left_tail, right_tail)

  defp equal_sides?(_left_side, _right_side), do: false
end
