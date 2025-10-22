defmodule LongestCommonPrefixOpt do
  @doc """
  Find the longest common prefix among an array of strings.

  ## Examples

  iex> LongestCommonPrefix.longest_common_prefix(["flower","flow","flight"])
  "fl"

  iex> LongestCommonPrefix.longest_common_prefix(["dog","racecar","car"])
  ""
  """
  @spec longest_common_prefix([String.t()]) :: String.t()
  def longest_common_prefix([first | strings]),
    do: Enum.reduce(strings, first, &common_prefix/2)

  defp common_prefix(s1, s2, common \\ "")

  defp common_prefix(<<c, s1::binary>>, <<c, s2::binary>>, common),
    do: common_prefix(s1, s2, common <> <<c>>)

  defp common_prefix(_, _, common), do: common
end
