defmodule AdventOfCode.Aoc2024.Day01Test do
  use ExUnit.Case
  doctest AdventOfCode.Aoc2024.Day01

  alias AdventOfCode.Aoc2024.Day01

  @input "../test/aoc_2024/inputs/day01_input.txt"

  test "part 1 with example input" do
    input = AdventOfCode.get_input!(@input)
    assert Day01.part_1(input) == 11
  end

  test "part 2 with example input" do
    input = AdventOfCode.get_input!(@input)
    assert Day01.part_2(input) == 31
  end
end
