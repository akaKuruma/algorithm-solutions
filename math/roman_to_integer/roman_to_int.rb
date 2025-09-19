# @param {Strinb} s
# @return {Integer}

ROMAN_MAP = {
  'I' => 1,
  'V' => 5,
  'X' => 10,
  'L' => 50,
  'C' => 100,
  'D' => 500,
  'M' => 1000
}

def roman_to_int(s)
  last_index = s.length - 1
  roman_s = s.chars

  roman_s.each_with_index.reduce(0) do |int_value, (roman_char, index)|
    curr_value = ROMAN_MAP[roman_char]
    next_value = ROMAN_MAP[roman_s[index + 1]]

    if index < last_index && curr_value < next_value
      int_value - curr_value
    else
      int_value + curr_value
    end
  end
end
