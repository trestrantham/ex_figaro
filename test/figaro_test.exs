defmodule FigaroTest do
  use ExUnit.Case, async: true

  setup_all do
    File.cd! "test/fixtures/project"

    on_exit fn ->
      System.delete_env("FOO")
      System.delete_env("BAR")
    end
  end

  setup do
    { :ok, _pid } = Figaro.start_link
    :ok
  end

  teardown do
    Agent.stop(:config)
  end

  test "parsing config.yml file" do
    assert Figaro.env.foo == "foo"
    assert Figaro.env.bar == "bar"
  end

  test "loading into system environment" do
    assert System.get_env("FOO") == "foo"
    assert System.get_env("BAR") == "bar"
  end
end
