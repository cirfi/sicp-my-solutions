(define (double n)
  (+ n n))
(define (halve n)
  (/ n 2))
(define (* a b)
  (cond ((= b 0) 0)
	((< b 0) (- (* a (- b))))
	((even? b) (double (* a (halve b))))
	(else (+ a (* a (- b 1))))))
