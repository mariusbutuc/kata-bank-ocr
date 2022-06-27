defmodule BankOcr.Impl.DigitTest do
  use ExUnit.Case, async: true
  alias BankOcr.Impl.Digit
  doctest Digit, import: true

  describe "from_string/1" do
    test "resolves 2" do
      string = "2"

      assert Digit.from_string(string) == %Digit{
               scan: [
                 " _ ",
                 " _|",
                 "|_ "
               ],
               string: string
             }
    end

    test "resolves 3" do
      string = "3"

      assert Digit.from_string(string) == %Digit{
               scan: [
                 " _ ",
                 " _|",
                 " _|"
               ],
               string: string
             }
    end

    test "resolves 4" do
      string = "4"

      assert Digit.from_string(string) == %Digit{
               scan: [
                 "   ",
                 "|_|",
                 "  |"
               ],
               string: string
             }
    end

    test "resolves 5" do
      string = "5"

      assert Digit.from_string(string) == %Digit{
               scan: [
                 " _ ",
                 "|_ ",
                 " _|"
               ],
               string: string
             }
    end

    test "resolves 6" do
      string = "6"

      assert Digit.from_string(string) == %Digit{
               scan: [
                 " _ ",
                 "|_ ",
                 "|_|"
               ],
               string: string
             }
    end

    test "resolves 7" do
      string = "7"

      assert Digit.from_string(string) == %Digit{
               scan: [
                 " _ ",
                 "  |",
                 "  |"
               ],
               string: string
             }
    end

    test "resolves 8" do
      string = "8"

      assert Digit.from_string(string) == %Digit{
               scan: [
                 " _ ",
                 "|_|",
                 "|_|"
               ],
               string: string
             }
    end

    test "resolves 9" do
      assert Digit.from_string("9") == %Digit{
               scan: [
                 " _ ",
                 "|_|",
                 " _|"
               ],
               string: "9"
             }
    end

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
    test "resolves 2" do
      scan = [
        " _ ",
        " _|",
        "|_ "
      ]

      assert Digit.from_scan(scan) == %Digit{scan: scan, string: "2"}
    end

    test "resolves 3" do
      scan = [
        " _ ",
        " _|",
        " _|"
      ]

      assert Digit.from_scan(scan) == %Digit{scan: scan, string: "3"}
    end

    test "resolves 4" do
      scan = [
        "   ",
        "|_|",
        "  |"
      ]

      assert Digit.from_scan(scan) == %Digit{scan: scan, string: "4"}
    end

    test "resolves 5" do
      scan = [
        " _ ",
        "|_ ",
        " _|"
      ]

      assert Digit.from_scan(scan) == %Digit{scan: scan, string: "5"}
    end

    test "resolves 6" do
      scan = [
        " _ ",
        "|_ ",
        "|_|"
      ]

      assert Digit.from_scan(scan) == %Digit{scan: scan, string: "6"}
    end

    test "resolves 7" do
      scan = [
        " _ ",
        "  |",
        "  |"
      ]

      assert Digit.from_scan(scan) == %Digit{scan: scan, string: "7"}
    end

    test "resolves 8" do
      scan = [
        " _ ",
        "|_|",
        "|_|"
      ]

      assert Digit.from_scan(scan) == %Digit{scan: scan, string: "8"}
    end

    test "resolves 9" do
      scan = [
        " _ ",
        "|_|",
        " _|"
      ]

      assert Digit.from_scan(scan) == %Digit{scan: scan, string: "9"}
    end

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
