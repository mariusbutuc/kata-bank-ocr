defmodule BankOcr.Impl.Validator do
  @moduledoc """
  Validate that the numbers are in fact valid account numbers.
  A valid account number has a valid checksum.
  """

  @doc """
  Validate that the given number is in fact a valid account number.

  ## Examples

      iex> valid?("123456789")
      true
  """
  @spec valid?(String.t()) :: boolean()
  def valid?(account_number) when is_binary(account_number) do
    account_number
    |> checksum()
    |> rem(11)
    |> Kernel.==(0)
  end

  @doc """
  Calculate the checksum of an account number

  account number:         3  4  5  8  8  2  8  6  5
  position names:        d9 d8 d7 d6 d5 d4 d3 d2 d1
  checksum calculation: (d1 + 2*d2 + 3*d3 +..+ 9*d9)

  ## Examples

      iex> checksum("345882865")
      231
  """
  @spec checksum(String.t()) :: integer()
  def checksum(account_number) when is_binary(account_number) do
    account_number
    |> String.graphemes()
    |> Enum.reverse()
    |> Enum.with_index()
    |> Enum.reduce(0, fn {digit_as_string, index}, sum ->
      {integer, _remainder} = Integer.parse(digit_as_string)
      factor = index + 1

      sum + integer * factor
    end)
  end
end
