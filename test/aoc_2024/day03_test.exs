defmodule AdventOfCode.Aoc2024.Day03Test do
  use ExUnit.Case
  doctest AdventOfCode.Aoc2024.Day03

  alias AdventOfCode.Aoc2024.Day03

  @input_1 "../test/aoc_2024/inputs/day03_input.txt"
  @input_2 "../test/aoc_2024/inputs/day03_input2.txt"

  test "part 1 with example input" do
    input = AdventOfCode.get_input!(@input_1)
    assert Day03.part_1(input) == 161
  end

  test "part 2 with example input" do
    input = AdventOfCode.get_input!(@input_2)
    assert Day03.part_2(input) == 48
  end
end
