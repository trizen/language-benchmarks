defmodule Tak do
    def tak(x, y, z) do
        if y < x do
            tak(tak(x - 1, y, z), tak(y - 1, z, x), tak(z - 1, x, y))
        else
            z
        end
    end
end

[a | tail] = System.argv
[b | tail] = tail
[c | _ ] = tail

{a, _} = Integer.parse(a)
{b, _} = Integer.parse(b)
{c, _} = Integer.parse(c)

IO.puts Tak.tak(a, b, c)
