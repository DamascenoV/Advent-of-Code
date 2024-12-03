defmodule AdventOfCode.Aoc2024.Day01 do
  @behaviour AdventOfCode.Behaviour
  @year "2024"
  @day "day01"

  @spec run() :: String.t()
  def run() do
    AdventOfCode.run(__MODULE__, "aoc_#{@year}/#{@day}/input.txt")
  end

  @spec part_1(binary()) :: integer()
  def part_1(content) do
    {id1, id2} =
      content
      |> parse_lines()

    calculate_distance(id1, id2)
  end

  @spec part_2(binary()) :: integer()
  def part_2(content) do
    {id1, id2} =
      content
      |> parse_lines()

    similary_score(id1, id2)
  end

  @spec parse_lines(binary()) :: {list(integer()), list(integer())}
  defp parse_lines(content) do
    content
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, ~r/\s+/, trim: true))
    |> Enum.map(fn [left, right] -> {String.to_integer(left), String.to_integer(right)} end)
    |> Enum.unzip()
  end

  @spec calculate_distance(list(integer()), list(integer())) :: integer()
  defp calculate_distance(id1, id2) do
    [Enum.sort(id1), Enum.sort(id2)]
    |> Enum.zip()
    |> Enum.reduce(0, fn {l, r}, acc -> acc + abs(l - r) end)
  end

  @spec similary_score(list(integer()), list(integer())) :: integer()
  defp similary_score(id1, id2) do
    frequencies = Enum.frequencies(id2)

    Enum.reduce(id1, 0, fn id, acc ->
      acc + id * Map.get(frequencies, id, 0)
    end)
  end
end
