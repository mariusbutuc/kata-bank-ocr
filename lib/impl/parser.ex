defmodule BankOcr.Impl.Parser do
  @moduledoc """
  Parse Ingenious Machine™ files into actual bank account numbers.
  """

  alias BankOcr.Impl.Digit

  @doc """
  Parse account number representation into account number string.

  TODO: Consider the input's type similarity with `Digit.ingenious_machine_representation/0`.
  """
  @spec parse([String.t(), ...]) :: String.t()
  def parse([row_1, row_2, row_3] = account_number)
      when is_binary(row_1) and is_binary(row_2) and is_binary(row_3) do
    account_number
    |> Enum.map(&chunk_digit_components/1)
    |> Enum.zip()
    |> Enum.map(fn scan_tuple ->
      scan_tuple
      # TODO: Reconsider converting `Digit.ingenious_machine_representation/0` to use tuples.
      |> Tuple.to_list()
      |> Digit.from_scan()
      |> Map.get(:string)
    end)
    |> Enum.join()
  end

  # TODO: If we need to consider performance, we may want to:
  #         * use `Stream.chunk_every/2` instead of `Enum.chunk_every/2`, or
  #         * drop UTF-8 support
  #
  #       Inspiration: https://elixirforum.com/t/39662/7?u=mariusbutuc
  defp chunk_digit_components(row, size \\ 3) do
    row
    |> String.codepoints()
    |> Enum.chunk_every(size)
    |> Enum.map(&Enum.join/1)
  end
end
