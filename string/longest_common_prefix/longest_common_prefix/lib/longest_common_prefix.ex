defmodule LongestCommonPrefix do
  @moduledoc """
  Write a function to find the longest common prefix string amongst an array of strings.

  If there is no common prefix, return an empty string "".



  Example 1:

  Input: strs = ["flower","flow","flight"]
  Output: "fl"
  Example 2:

  Input: strs = ["dog","racecar","car"]
  Output: ""
  Explanation: There is no common prefix among the input strings.


  Constraints:

  1 <= strs.length <= 200
  0 <= strs[i].length <= 200
  strs[i] consists of only lowercase English letters if it is non-empty.
  """

  @doc """
  Find the longest common prefix among an array of strings.

  ## Examples

  iex> LongestCommonPrefix.longest_common_prefix(["flower","flow","flight"])
  "fl"

  iex> LongestCommonPrefix.longest_common_prefix(["dog","racecar","car"])
  ""
  """
  @spec longest_common_prefix(strs :: [String.t()]) :: String.t()
  def longest_common_prefix(strs) do
    [first_str | others] = strs
    min_int = find_min_common(first_str, others)
    if min_int > 0, do: String.slice(first_str, 0..(min_int - 1)), else: ""
  end

  defp find_min_common(_str, []), do: 201

  defp find_min_common(ref_str, [current_str | others]) do
    min(min_common(ref_str, current_str, 0), find_min_common(ref_str, others))
  end

  defp min_common(str1, str2, n_common) when str1 == "" or str2 == "", do: n_common
  defp min_common(<<s1, _s1::binary>>, <<s2, _s2::binary>>, n_common) when s1 != s2, do: n_common

  defp min_common(<<s1, s1_rest::binary>>, <<s2, s2_rest::binary>>, n_common)
       when s1 == s2,
       do: min_common(s1_rest, s2_rest, n_common + 1)
end
