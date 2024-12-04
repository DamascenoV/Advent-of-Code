defmodule AdventOfCode do
  @moduledoc """
  Documentation for `AdventOfCode`.
  """
  @spec run(module(), String.t()) :: String.t()
  def run(module, path) do
    input = get_input!(path)
    part1 = module.part_1(input)
    part2 = module.part_2(input)

    "Part 1: #{part1}\nPart 2: #{part2}"
  end

  @spec get_input!(String.t()) :: binary()
  def get_input!(path) do
    Path.expand(path, __DIR__)
    |> File.read!()
  end

  @spec get_grid(binary()) :: %{optional({non_neg_integer(), non_neg_integer()}) => String.t()}
  def get_grid(content) do
    content
    |> String.split("\n", trim: true)
    |> Enum.with_index()
    |> Enum.reduce(Map.new(), fn {line, i}, map ->
      String.graphemes(line)
      |> Enum.with_index()
      |> Enum.reduce(map, fn {col, j}, map ->
        Map.put(map, {i + 1, j + 1}, col)
      end)
    end)
  end
end
