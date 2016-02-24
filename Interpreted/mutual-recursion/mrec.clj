(declare F) ; forward reference

(defn M [n]
  (if (zero? n)
    0
    (- n (F (M (dec n))))))

(defn F [n]
  (if (zero? n)
    1
    (- n (M (F (dec n))))))

(println (F (Integer/parseInt (first *command-line-args* ))))
(println (M (Integer/parseInt (first *command-line-args* ))))
