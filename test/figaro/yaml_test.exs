defmodule FigaroYamlTest do
  use ExUnit.Case
  alias Figaro.Yaml

  test "Yaml.parse_file parses a yaml file to a map" do
    file = "test/fixtures/config1.yml"

    assert Yaml.parse_file(file) == %{foo: "foo", bar: "bar"}
  end

  test "Yaml.parse_file parses a nested yaml file to a nested map" do
    file = "test/fixtures/config2.yml"

    assert Yaml.parse_file(file) == %{foo: "foo", bar: "bar", test: %{env: "test"}}
  end
end
