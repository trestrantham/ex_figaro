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
