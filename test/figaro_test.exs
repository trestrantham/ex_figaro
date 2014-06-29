defmodule FigaroTest do
  use ExUnit.Case, async: true

  setup_all do
    # the application starts automatically which uses config/application.yml
    # so let's stop it and change to our test directory to use our fixtures
    Application.stop(:figaro)
    File.cd! "test/fixtures/project"
    Application.start(:figaro)

    on_exit fn ->
      System.delete_env("FOO")
      System.delete_env("BAR")
    end
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
