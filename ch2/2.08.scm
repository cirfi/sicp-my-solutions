(define (make-interval a b)
  (cons a b))

(define (lower-bound x)
  (min (car x)
       (cdr x)))

(define (upper-bound x)
  (max (car x)
       (cdr x)))

(define (sub-interval x y)
  (make-interval (- (lower-bound x)
		    (upper-bound y))
		 (- (upper-bound x)
		    (lower-bound y))))
