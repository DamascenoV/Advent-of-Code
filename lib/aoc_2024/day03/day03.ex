defmodule AdventOfCode.Aoc2024.Day03 do
  @year "2024"
  @day "day03"
  @behaviour AdventOfCode.Behaviour

  @spec run() :: String.t()
  def run() do
    AdventOfCode.run(__MODULE__, "aoc_#{@year}/#{@day}/input.txt")
  end

  @spec part_1(binary()) :: integer()
  def part_1(content) do
    Regex.scan(~r/mul\((\d{1,3}),(\d{1,3})\)/, content)
    |> Enum.reduce(0, fn [_, x, y], total ->
      total + String.to_integer(x) * String.to_integer(y)
    end)
  end

  @spec part_1(binary()) :: integer()
  def part_2(content) do
    content
    |> String.split("do()")
    |> Enum.reduce(0, fn exp, result ->
      [head | _] = String.split(exp, "don't()")
      result + part_1(head)
    end)
  end
end
