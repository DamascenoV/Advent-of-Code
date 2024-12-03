defmodule AdventOfCode.Aoc2024.Day02Test do
  use ExUnit.Case
  doctest AdventOfCode.Aoc2024.Day02

  alias AdventOfCode.Aoc2024.Day02

  @input "../test/aoc_2024/inputs/day02_input.txt"

  test "part 1 with example input" do
    input = AdventOfCode.get_input!(@input)
    assert Day02.part_1(input) == 2
  end

  test "part 2 with example input" do
    input = AdventOfCode.get_input!(@input)
    assert Day02.part_2(input) == 4
  end
end
