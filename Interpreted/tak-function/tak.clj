
(defn tak [x y z]
  (if (< y x)
    (tak (tak (dec x) y z) (tak (dec y) z x) (tak (dec z) x y))
    z))

(println (tak (Integer/parseInt (first *command-line-args* )) (Integer/parseInt (second *command-line-args* )) (Integer/parseInt (last *command-line-args* ))))
