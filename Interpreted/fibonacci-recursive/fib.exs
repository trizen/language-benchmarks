defmodule Fib do
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n) do
    fib(n-2) + fib(n-1)
  end
end

[n | _] = System.argv
{n, _} = Integer.parse(n)

IO.puts Fib.fib(n)
