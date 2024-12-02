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

  @spec get_input!(String.t()) :: [binary()]
  def get_input!(path) do
    Path.join(__DIR__, path)
    |> File.read!()
    |> String.split("\n", trim: true)
  end
end
