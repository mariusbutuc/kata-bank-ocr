defmodule BankOcr.Parser do
  @moduledoc """
  Parse Ingenious Machine™ files into actual bank account numbers.
  """

  @doc """
  Parse account number string representation into account number string.
  """
  @spec parse(String.t()) :: String.t()
  def parse(account_number) do
    account_number
  end
end
