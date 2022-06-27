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
        " _|",
        "|_ "
      ],
      string: "2"
    },
    %Digit{
      scan: [
        " _ ",
        " _|",
        " _|"
      ],
      string: "3"
    },
    %Digit{
      scan: [
        "   ",
        "|_|",
        "  |"
      ],
      string: "4"
    },
    %Digit{
      scan: [
        " _ ",
        "|_ ",
        " _|"
      ],
      string: "5"
    },
    %Digit{
      scan: [
        " _ ",
        "|_ ",
        "|_|"
      ],
      string: "6"
    },
    %Digit{
      scan: [
        " _ ",
        "  |",
        "  |"
      ],
      string: "7"
    },
    %Digit{
      scan: [
        " _ ",
        "|_|",
        "|_|"
      ],
      string: "8"
    },
    %Digit{
      scan: [
        " _ ",
        "|_|",
        " _|"
      ],
      string: "9"
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
