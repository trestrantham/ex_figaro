defmodule FigaroUtilsTest do
  use ExUnit.Case, async: true

  test "format_yaml converts a flat yaml list to a map" do
    assert Figaro.Utils.format_yaml([foo: :bar, baz: :qux]) == %{foo: "bar", baz: "qux"}
  end
end
