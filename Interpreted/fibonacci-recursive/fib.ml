let rec fib_rec n =
  if n < 2 then
    n
  else
    fib_rec (n - 1) + fib_rec (n - 2)

let () =
  Printf.printf "%d\n" (fib_rec (int_of_string Sys.argv.(1)))
