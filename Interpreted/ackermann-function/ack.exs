defmodule Ackermann do
  def ack(0, n), do: n + 1
  def ack(m, 0), do: ack(m - 1, 1)
  def ack(m, n), do: ack(m - 1, ack(m, n - 1))
end

[n | tail] = System.argv
[m | _] = tail

{n, _} = Integer.parse(n)
{m, _} = Integer.parse(m)

IO.puts Ackermann.ack(n, m)
