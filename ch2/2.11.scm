(define (make-interval a b)
  (cons a b))

(define (lower-bound x)
  (min (car x)
       (cdr x)))

(define (upper-bound x)
  (max (car x)
       (cdr x)))

(define (mul-interval x y)
  (let ((mul-x (* (upper-bound x) (lower-bound x)))
	(mul-y (* (upper-bound y) (lower-bound y)))
	(up-x (upper-bound x))
	(up-y (upper-bound y))
	(low-x (lower-bound x))
	(low-y (lower-bound y)))
    (cond ((< mul-x 0)
	   (cond ((< mul-y 0)
		  (make-interval (min (* up-x low-y) (* low-x up-y))
				 (max (* up-x up-y) (* low-x low-y))))
		 ((< up-y 0)
		  (make-interval (* up-x low-y)
				 (* low-x low-y)))
		 (else
		  (make-interval (* low-x up-y)
				 (* up-x up-y)))))
	  ((< up-x 0)
	   (cond ((< mul-y 0)
		  (make-interval (* low-x up-y)
				 (* low-x low-y)))
		 ((< up-y 0)
		  (make-interval (* up-x up-y)
				 (* low-x low-y)))
		 (else
		  (make-interval (* low-x up-y)
				 (* up-x low-y)))))
	  (else
	   (cond ((< mul-y 0)
		  (make-interval (* up-x low-y)
				 (* up-x up-y)))
		 ((< up-y 0)
		  (make-interval (* up-x low-y)
				 (* low-x up-y)))
		 (else
		  (make-interval (* low-x low-y)
				 (* up-x up-y))))))))
