defmodule AdventOfCode.Aoc2024.Day01 do
  @year "2024"
  @day "day01"

  def run() do
    input = AdventOfCode.get_input!("aoc_#{@year}/#{@day}/input.txt")
    part1_result = part_1(input)
    part2_result = part_2(input)

    "Part 1: #{part1_result}\nPart 2: #{part2_result}"
  end

  def part_1(content) do
    {id1, id2} =
      content
      |> parse_file()

    calculate_distance(id1, id2)
  end

  def part_2(content) do
    {id1, id2} =
      content
      |> parse_file()

    similary_score(id1, id2)
  end

  defp parse_file(content) do
    content
    |> String.split("\n", trim: true)
    |> Enum.map(&String.split(&1, ~r/\s+/, trim: true))
    |> Enum.map(fn [left, right] -> {String.to_integer(left), String.to_integer(right)} end)
    |> Enum.unzip()
  end

  defp calculate_distance(id1, id2) do
    left = Enum.sort(id1)
    right = Enum.sort(id2)

    left
    |> Enum.zip(right)
    |> Enum.reduce(0, fn {l, r}, acc -> acc + abs(l - r) end)
  end

  defp similary_score(id1, id2) do
    frequencies = Enum.frequencies(id2)

    Enum.reduce(id1, 0, fn id, acc ->
      acc + id * Map.get(frequencies, id, 0)
    end)
  end
end