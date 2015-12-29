(defn fib [n]
  (case n
    0 0
    1 1
    (+ (fib (- n 1))
       (fib (- n 2)))))

(println (fib (Integer/parseInt (first *command-line-args* ))))
