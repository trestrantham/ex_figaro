defmodule FigaroTest do
  use ExUnit.Case, async: true

  setup do
    # the application starts automatically which uses config/application.yml
    # so let's stop it so our tests can change to our test directory and use
    # our fixtures
    Application.stop(:figaro)

    project_dir = File.cwd!

    on_exit fn ->
      File.cd! project_dir

      Application.stop(:figaro)

      System.delete_env("FOO")
      System.delete_env("BAR")
    end
  end

  test "parsing config.yml file" do
    File.cd! "test/fixtures/project"
    Application.start(:figaro)

    assert Figaro.env.foo == "foo"
    assert Figaro.env.bar == "bar"
  end

  test "loading into system environment" do
    File.cd! "test/fixtures/project"
    Application.start(:figaro)

    assert System.get_env("FOO") == "foo"
    assert System.get_env("BAR") == "bar"
  end

  test "raises an error if application.yml isn't found" do
    File.cd! "test/fixtures/project2"
    assert { :error, _reason } = Application.start(:figaro)
  end
end
