defmodule BankOcr.ParserTest do
  use ExUnit.Case, async: true

  alias BankOcr.Parser
  doctest Parser, import: true

  test "parses zeros" do
    account_number = [
      " _  _  _  _  _  _  _  _  _ ",
      "| || || || || || || || || |",
      "|_||_||_||_||_||_||_||_||_|"
    ]

    assert Parser.parse(account_number) == "000000000"
  end

  @tag :skip
  test "parses ones" do
    account_number = [
      "                           ",
      "  |  |  |  |  |  |  |  |  |",
      "  |  |  |  |  |  |  |  |  |"
    ]

    assert Parser.parse(account_number) == "111111111"
  end

  @tag :skip
  test "parses twos" do
    account_number = [
      " _  _  _  _  _  _  _  _  _ ",
      " _| _| _| _| _| _| _| _| _|",
      "|_ |_ |_ |_ |_ |_ |_ |_ |_ "
    ]

    assert Parser.parse(account_number) == "222222222"
  end

  @tag :skip
  test "parses threes" do
    account_number = [
      " _  _  _  _  _  _  _  _  _ ",
      " _| _| _| _| _| _| _| _| _|",
      " _| _| _| _| _| _| _| _| _|"
    ]

    assert Parser.parse(account_number) == "333333333"
  end

  @tag :skip
  test "parses fours" do
    account_number = [
      "                           ",
      "|_||_||_||_||_||_||_||_||_|",
      "  |  |  |  |  |  |  |  |  |"
    ]

    assert Parser.parse(account_number) == "444444444"
  end

  @tag :skip
  test "parses fives" do
    account_number = [
      " _  _  _  _  _  _  _  _  _ ",
      "|_ |_ |_ |_ |_ |_ |_ |_ |_ ",
      " _| _| _| _| _| _| _| _| _|"
    ]

    assert Parser.parse(account_number) == "555555555"
  end

  @tag :skip
  test "parses sixes" do
    account_number = [
      " _  _  _  _  _  _  _  _  _ ",
      "|_ |_ |_ |_ |_ |_ |_ |_ |_ ",
      "|_||_||_||_||_||_||_||_||_|"
    ]

    assert Parser.parse(account_number) == "666666666"
  end

  @tag :skip
  test "parses sevens" do
    account_number = [
      " _  _  _  _  _  _  _  _  _ ",
      "  |  |  |  |  |  |  |  |  |",
      "  |  |  |  |  |  |  |  |  |"
    ]

    assert Parser.parse(account_number) == "777777777"
  end

  @tag :skip
  test "parses eights" do
    account_number = [
      " _  _  _  _  _  _  _  _  _ ",
      "|_||_||_||_||_||_||_||_||_|",
      "|_||_||_||_||_||_||_||_||_|"
    ]

    assert Parser.parse(account_number) == "888888888"
  end

  @tag :skip
  test "parses nines" do
    account_number = [
      " _  _  _  _  _  _  _  _  _ ",
      "|_||_||_||_||_||_||_||_||_|",
      " _| _| _| _| _| _| _| _| _|"
    ]

    assert Parser.parse(account_number) == "999999999"
  end

  @tag :skip
  test "parses all digits" do
    account_number = [
      "    _  _     _  _  _  _  _ ",
      "  | _| _||_||_ |_   ||_||_|",
      "  ||_  _|  | _||_|  ||_| _|"
    ]

    assert Parser.parse(account_number) == "123456789"
  end
end
