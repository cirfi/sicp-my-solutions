;;; normal-order
(gcd 206 40)
(if (= 40 0)
    206
    (gce 40 (remainder 206 40)))
(if (= (remainder 206 40) 0)
    40
    (gce (remainder 206 40) (remainder 40 (remainder 206 40))))
;;; I'm lazy...
;;; totally 18 operations

;;; applicative-order
(gcd 206 40)
(gcd 40 (remainder 206 40))
(gcd 40 6)
(gcd 6 (remainder 40 6))
(gcd 6 4)
(gcd 4 (remainder 6 4))
(gcd 4 2)
(gcd 2 (remainder 4 2))
(gcd 2 0)
2
;;; totally 4 operations
