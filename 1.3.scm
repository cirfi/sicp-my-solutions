(define (square-larger-two x y z)
  (cond ((and (< x y) (< x z)) (+ (* y y) (* z z)))
	((and (< y x) (< y z)) (+ (* x x) (* z z)))
	(else (+ (* x x) (* y y)))))
