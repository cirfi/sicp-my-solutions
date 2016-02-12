(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (cond ((close-enough? guess next) next)
	    (else (try next)))))
  (try first-guess))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f times)
  (cond ((< times 1)
	 (lambda (x) x))
	(else
	 (compose f (repeated f (- times 1))))))

(define (average x y)
  (/ (+ x y)
     2.0))

(define (average-dump f)
  (lambda (x)
    (average x
	     (f x))))

(define (average-dumped f times)
  ((repeated average-dump times) f))

(define (root num degree)
  (define (get-max-pow n)
    (define (log2 x)
      (/ (log x)
	 (log 2)))
    (floor (log2 n)))
  (define (pow b e)
    (cond ((= e 0) 1)
	  ((even? e) (square (pow b (/ e 2))))
	  (else (* b (pow b (- e 1))))))
  (fixed-point (average-dumped (lambda (x)
				 (/ num
				    (pow x (- degree 1))))
			       (get-max-pow degree))
	       1))

(root 81 4)
;;; 3.000000000000033
