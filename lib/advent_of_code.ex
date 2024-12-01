defmodule AdventOfCode do
  @moduledoc """
  Documentation for `AdventOfCode`.
  """

  def get_input!(path) do
    Path.join(__DIR__, path)
    |> File.read!()
  end
end
