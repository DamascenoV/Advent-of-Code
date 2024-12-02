defmodule AdventOfCode.Behaviour do
  @callback run() :: String.t()
  @callback part_1(binary()) :: any()
  @callback part_2(binary()) :: any()
end
