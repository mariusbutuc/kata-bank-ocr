defmodule BankOcr.Parser do
  @moduledoc """
  Parse Ingenious Machine™ files into actual bank account numbers.
  """

  @doc """
  Parse account number representation into account number string.
  """
  @spec parse([String.t(), ...]) :: String.t()
  def parse([row_1, row_2, row_3] = _account_number)
      when is_binary(row_1) and is_binary(row_2) and is_binary(row_3) do
    row_1 <> row_2 <> row_3
  end
end
