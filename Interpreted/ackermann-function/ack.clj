(defn ackermann [m n]
  (cond (zero? m) (inc n)
        (zero? n) (ackermann (dec m) 1)
        :else (ackermann (dec m) (ackermann m (dec n)))))

(println (ackermann (Integer/parseInt (first *command-line-args* )) (Integer/parseInt (second *command-line-args* ))))
