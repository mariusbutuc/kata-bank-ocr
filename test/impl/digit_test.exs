defmodule BankOcr.Impl.DigitTest do
  use ExUnit.Case, async: true
  alias BankOcr.Impl.Digit
  doctest Digit, import: true

  describe "from_string/1" do
    test "returns `nil` for nonexistent string representation" do
      assert Digit.from_string("nonexistent") == nil
    end

    test "raises a meaningful error for invalid input" do
      expected_message = "no function clause matching in BankOcr.Impl.Digit.from_string/1"

      assert_raise FunctionClauseError, expected_message, fn ->
        Digit.from_string(1)
      end
    end
  end

  describe "from_scan/1" do
    test "returns `nil` for nonexistent scan representation (?)" do
      input = [
        " _ ",
        " _|",
        "|  "
      ]

      assert Digit.from_scan(input) == nil
    end

    test "raises a meaningful error for invalid input: single string / invalid representation" do
      expected_message = "no function clause matching in BankOcr.Impl.Digit.from_scan/1"

      assert_raise FunctionClauseError, expected_message, fn ->
        input =
          [
            " _ ",
            "| |",
            "|_|"
          ]
          |> Enum.join()

        Digit.from_scan(input)
      end
    end

    test "raises a meaningful error for invalid input: integer / invalid type" do
      expected_message = "no function clause matching in BankOcr.Impl.Digit.from_scan/1"

      assert_raise FunctionClauseError, expected_message, fn ->
        Digit.from_scan(0)
      end
    end
  end
end
