defmodule MutualRecursion do
  def f(0), do: 1
  def f(n), do: n - m(f(n - 1))
  def m(0), do: 0
  def m(n), do: n - f(m(n - 1))
end

[n | _] = System.argv
{n, _} = Integer.parse(n)

IO.puts MutualRecursion.f(n)
IO.puts MutualRecursion.m(n)
