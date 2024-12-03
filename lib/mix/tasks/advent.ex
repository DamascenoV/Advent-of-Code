defmodule Mix.Tasks.Advent do
  @moduledoc """
  Usage: mix advent <year> <day>
  """
  @shortdoc "Run Solution of the Advent of Code by Year and Date."
  use Mix.Task
  require Logger

  def run(args) do
    case args do
      [year, day] ->
        module_name =
          Module.concat([
            "AdventOfCode",
            String.to_atom("Aoc#{year}"),
            String.to_atom("Day#{day}")
          ])

        if Code.ensure_loaded?(module_name) and function_exported?(module_name, :run, 0) do
          Logger.info("\nRunning Aoc #{year} - #{day}:\n\n#{apply(module_name, :run, [])}")
        else
          Logger.error(
            "Module #{module_name} does not exist or the `run/0` function is not defined."
          )
        end

      _ ->
        Logger.error("Invalid arguments. Usage: mix advent <year> <day>")
    end
  end
end
