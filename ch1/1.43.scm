(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f times)
  (cond ((<= times 0)
	 (lambda (x)
	   x))
	(else
	 (compose f (repeated f (- times 1))))))

(define (square x)
  (* x x))

((repeated square 2) 5)
