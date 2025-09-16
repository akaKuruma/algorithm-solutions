# Check if a integer is a palindrome
class Palindrome
  def self.is_palindrome(x)
    return false if x.negative?
    return true if x < 10

    arr = x.to_s.chars

    left_max = arr.length == 2 ? 0 : ((arr.length / 2) - 1)

    right_first = left_max
    right_first += (arr.length.odd? ? 2 : 1)
    right_max = (arr.length - 1)

    left_arr = arr[0..left_max]
    right_arr = arr[right_first..right_max]

    left_arr == right_arr.reverse
  end

  def self.opt_palindrome?(x)
    return false if x < 0 || (x % 10 == 0 && x != 0)

    reverted = 0
    while x > reverted
      reverted = reverted * 10 + x % 10
      x /= 10
    end

    x == reverted || x == reverted / 10
  end
end
