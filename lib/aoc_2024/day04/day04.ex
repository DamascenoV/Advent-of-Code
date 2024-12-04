defmodule AdventOfCode.Aoc2024.Day04 do
  @year "2024"
  @day "day04"
  @behaviour AdventOfCode.Behaviour

  @spec run() :: String.t()
  def run() do
    AdventOfCode.run(__MODULE__, "aoc_#{@year}/#{@day}/input.txt")
  end

  @spec part_1(binary()) :: integer()
  def part_1(content) do
    process_grid(content, "X", &find_xmas/2)
  end

  @spec part_1(binary()) :: integer()
  def part_2(content) do
    process_grid(content, "A", &find_x_mas/2)
  end

  @spec process_grid(binary(), String.t(), function()) :: non_neg_integer()
  defp process_grid(content, marker, pattern_finder) do
    grid = AdventOfCode.get_grid(content)

    grid
    |> Enum.filter(fn {_, check} -> check == marker end)
    |> Enum.map(&elem(&1, 0))
    |> Enum.flat_map(&pattern_finder.(&1, grid))
    |> length()
  end

  @spec find_xmas({integer(), integer()}, map()) :: list({integer(), integer})
  defp find_xmas(cord, input) do
    directions = [{-1, 0}, {-1, 1}, {0, 1}, {1, 1}, {1, 0}, {1, -1}, {0, -1}, {-1, -1}]

    Enum.filter(directions, fn next ->
      match?(cord, next, 1, "M", input) &&
        match?(cord, next, 2, "A", input) &&
        match?(cord, next, 3, "S", input)
    end)
  end

  @spec find_x_mas({integer(), integer()}, map()) :: list(list({integer(), integer()}))
  defp find_x_mas(cord, input) do
    pattern_sets = [
      [[{1, -1}, {1, 1}], [{-1, 1}, {-1, -1}]],
      [[{-1, -1}, {1, -1}], [{-1, 1}, {1, 1}]]
    ]

    Enum.filter(pattern_sets, fn [p1, p2] ->
      check_pattern_set(cord, input, p1, p2) || check_pattern_set(cord, input, p2, p1)
    end)
  end

  @spec match?(
          {integer(), integer()},
          {integer(), integer()},
          integer(),
          String.t(),
          map()
        ) :: boolean()
  defp match?({line1, col1}, {line2, col2}, offset, letter, grid) do
    Map.get(grid, {line1 + offset * line2, col1 + offset * col2}) == letter
  end

  @spec check_pattern_set(
          {integer(), integer()},
          map(),
          list({integer(), integer()}),
          list({integer(), integer()})
        ) :: boolean
  defp check_pattern_set(cord, input, first_set, second_set) do
    Enum.all?(first_set, &match?(cord, &1, 1, "M", input)) &&
      Enum.all?(second_set, &match?(cord, &1, 1, "S", input))
  end
end
