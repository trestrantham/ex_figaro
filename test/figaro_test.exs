defmodule FigaroTest do
  use ExUnit.Case, async: true

  setup_all do
    File.cd! "test/fixtures/project"

    Figaro.load
  end

  teardown_all do
    System.delete_env("FOO")
    System.delete_env("BAR")
  end

  test "parsing config.yml file" do
    assert Figaro.get("foo") == "foo"
    assert Figaro.get("bar") == "bar"
  end

  test "loading into system environment" do

    assert System.get_env("FOO") == "foo"
    assert System.get_env("BAR") == "bar"
  end
end
