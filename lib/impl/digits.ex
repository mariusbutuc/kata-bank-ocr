defmodule BankOcr.Impl.Digits do
  alias BankOcr.Impl.Digit

  @digits [
    %Digit{
      scan: [
        "   ",
        "  |",
        "  |"
      ],
      string: "1"
    },
    %Digit{
      scan: [
        " _ ",
        "| |",
        "|_|"
      ],
      string: "0"
    }
  ]

  @spec all() :: list(Digit.t())
  def all(), do: @digits
end
