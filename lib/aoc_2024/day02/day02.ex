defmodule AdventOfCode.Aoc2024.Day02 do
  @behaviour AdventOfCode.Behaviour
  @year "2024"
  @day "day02"

  @spec run() :: String.t()
  def run() do
    AdventOfCode.run(__MODULE__, "aoc_#{@year}/#{@day}/input.txt")
  end

  @spec part_1(binary()) :: integer()
  def part_1(content) do
    content
    |> parse_reports()
    |> Enum.count(&is_safe?/1)
  end

  @spec part_2(binary()) :: integer()
  def part_2(content) do
    content
    |> parse_reports()
    |> Enum.count(&is_safe_with_dampener?/1)
  end

  @spec parse_reports(binary()) :: list(list(integer()))
  defp parse_reports(content) do
    content
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
  end

  @spec parse_line(binary()) :: list(integer())
  defp parse_line(line) do
    line
    |> String.split()
    |> Enum.map(&String.to_integer/1)
  end

  @spec is_safe_with_dampener?(list(integer())) :: boolean()
  defp is_safe_with_dampener?(report) do
    if is_safe?(report) do
      true
    else
      Enum.any?(0..(length(report) - 1), fn index ->
        report
        |> List.delete_at(index)
        |> is_safe?()
      end)
    end
  end

  @spec is_safe?(list(integer())) :: boolean()
  defp is_safe?(report) do
    valid_differences?(report) and (all_increasing?(report) or all_decreasing?(report))
  end

  @spec valid_differences?(list(integer())) :: boolean()
  defp valid_differences?(report) do
    Enum.chunk_every(report, 2, 1, :discard)
    |> Enum.all?(fn [x, y] -> abs(x - y) in 1..3 end)
  end

  @spec all_increasing?(list(integer())) :: boolean()
  defp all_increasing?(report) do
    Enum.chunk_every(report, 2, 1, :discard)
    |> Enum.all?(fn [x, y] -> x < y end)
  end

  @spec all_decreasing?(list(integer())) :: boolean()
  defp all_decreasing?(report) do
    Enum.chunk_every(report, 2, 1, :discard)
    |> Enum.all?(fn [x, y] -> x > y end)
  end
end
