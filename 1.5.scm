;;; applicative-order
(test 0 (p))
;; first calculate (p)
;; (= (p) (p))
;; It loops.
;;; normal-order
(test 0 (p))
(if (= 0 0)
    0
    (p))
(if #t
    0
    (p))
;; result: 0
