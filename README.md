Figaro
======
[![Build Status](http://img.shields.io/travis/trestrantham/ex_figaro.svg?style=flat "Build Status")](http://travis-ci.org/trestrantham/ex_figaro)
[![Coverage Status](http://img.shields.io/coveralls/trestrantham/ex_figaro.svg?style=flat)](https://coveralls.io/r/trestrantham/ex_figaro?branch=master)

Port of [@laserlemon](http://github.com/laserlemon)'s [Figaro](http://github.com/laserlemon/figaro) project to Elixir. Please see the original project
for details about how Figaro works.

### Getting Started

Add Figaro as a dependency in your `mix.exs` file.

```elixir
defp deps do
  [{ :figaro, ">= 0.0.0" }]
end
```

You should also update your applications list to include Figaro:

```elixir
def application do
  [applications: [:figaro]]
end
```

After you are done, run `mix deps.get` in your shell to fetch the dependencies.

### Usage

Given the following configuration file:

```yaml
# config/application.yml

foo: bar
baz: qux
```

You will have access to configuration values via `Figaro.env`:

```elixir
iex> Figaro.env.foo
"bar"
iex> Figaro.env.baz
"qux"
iex> Figaro.env
%{foo: "bar", baz: "qux"}
```

Figaro also sets `ENV` with values defined in `application.yml`:

```elixir
iex> System.get_env("FOO")
"bar"
iex> System.get_env("BAZ")
"qux"
```

**Please note:** `ENV` is a simple key/value store. All values will be converted to strings. Deeply nested configuration structures are not possible.
