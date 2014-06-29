defmodule Figaro.Supervisor do
  use Supervisor

  def start_link do
    :supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    children = [
      worker(Figaro, [])
    ]

    supervise(children, strategy: :one_for_one)
  end
end

