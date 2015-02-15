let rec a m n =
  if m=0 then (n+1) else
  if n=0 then (a (m-1) 1) else
  (a (m-1) (a m (n-1)))

let () =
  Printf.printf "%d\n" (a (int_of_string Sys.argv.(1)) (int_of_string Sys.argv.(2)))
