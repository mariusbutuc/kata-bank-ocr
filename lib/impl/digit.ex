defmodule BankOcr.Impl.Digit do
  @moduledoc """
  Model digit representation.
  """

  alias BankOcr.Impl.Digits

  @typedoc """
  A digit has both
    * a `scan` representation, as scanned by the Ingenious Machine™, and
    * a `string` representation
  """
  @type t :: %__MODULE__{
          scan: ingenious_machine_representation(),
          string: String.t()
        }

  @typedoc """
  Digit representation as scanned by the Ingenious Machine™, written using pipes and underscores

  TODO: Consider further refining the type to describe more specific shape:
        * tuple(String.t(), String.t(), String.t())
        * list(String.t(), String.t(), String.t())
  """
  @type ingenious_machine_representation :: list(String.t())

  defstruct [:scan, :string]

  @doc """
  Return the `Digit` corresponding to the scan representation

  ## Examples

      iex> from_scan([
      ...>   " _ ",
      ...>   "| |",
      ...>   "|_|"
      ...> ])
      %BankOcr.Impl.Digit{scan: [
        " _ ",
        "| |",
        "|_|"
      ], string: "0"}

      iex> from_scan([
      ...>   "   ",
      ...>   "  |",
      ...>   "  |"
      ...> ])
      %BankOcr.Impl.Digit{scan: [
        "   ",
        "  |",
        "  |"
      ], string: "1"}

  """
  @spec from_scan(ingenious_machine_representation()) :: String.t()
  def from_scan([row_1, row_2, row_3] = scan)
      when is_list(scan) and is_binary(row_1) and is_binary(row_2) and is_binary(row_3) do
    Digits.all()
    |> Enum.find(fn %__MODULE__{} = digit -> digit.scan == scan end)
  end

  @doc """
  Return the `Digit` corresponding to the string representation

  ## Examples

      iex> from_string("0")
      %BankOcr.Impl.Digit{scan: [
        " _ ",
        "| |",
        "|_|"
      ], string: "0"}

      iex> from_string("1")
      %BankOcr.Impl.Digit{scan: [
        "   ",
        "  |",
        "  |"
      ], string: "1"}

  """
  @spec from_string(String.t()) :: ingenious_machine_representation()
  def from_string(string) when is_binary(string) do
    Digits.all()
    |> Enum.find(fn %__MODULE__{} = digit -> digit.string == string end)
  end
end
