defmodule BankOcr.Impl.ValidatorTest do
  use ExUnit.Case, async: true
  alias BankOcr.Impl.Validator
  doctest Validator, import: true

  describe "valid?/1" do
    test "resolves 345882865 to be valid" do
      assert Validator.valid?("345882865") == true
    end

    test "resolves 123456780 to not be valid" do
      assert Validator.valid?("123456780") == false
    end

    @tag :skip
    test "raises a meaningful error for invalid input"
  end
end
