(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f times)
  (cond ((<= times 0)
	 (lambda (x)
	   x))
	(else
	 (compose f (repeated f (- times 1))))))

(define dx 0.00001)

(define (average x y z)
  (/ (+ x y z)
     3))

(define (smooth f)
  (lambda (x)
    (average (f (- x dx))
	     (f x)
	     (f (+ x dx)))))

(define (smoothed f times)
  ((repeated smooth times) f))
