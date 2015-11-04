defmodule Levenshtein do
  def first_letter_check(one_letter, two_letter) do
    case one_letter == two_letter do
      true -> 0
      false -> 1
    end
  end

  def distance(string_1, string_1), do: 0
  def distance(string, ''), do: :string.len(string)
  def distance('', string), do: :string.len(string)
  def distance([h1|rest1], [h2|rest2]) do
    cost = first_letter_check(h1, h2)

    :lists.min([
              distance(rest1, [h2|rest2]) + 1,
              distance([h1|rest1], rest2) + 1,
              distance(rest1, rest2) + cost
              ])
  end
end

[s | tail] = System.argv
[t | _] = tail

s = s |> to_char_list
t = t |> to_char_list

IO.puts Levenshtein.distance(s, t);
