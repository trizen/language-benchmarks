let rec tak x y z =
  if y < x then
    (tak (tak (x-1) y z) (tak (y-1) z x) (tak (z-1) x y))
  else
    z

let () =
  Printf.printf "%d\n" (tak (int_of_string Sys.argv.(1)) (int_of_string Sys.argv.(2)) (int_of_string Sys.argv.(3)))
