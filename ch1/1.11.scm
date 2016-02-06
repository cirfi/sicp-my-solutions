;;; recursive
(define (f1 n)
  (cond ((< n 3) n)
	(else (+ (f1 (- n 1))
		 (* 2 (f1 (- n 2)))
		 (* 3 (f1 (- n 3)))))))
;;; interative
(define (f2 n)
  (define (f2-iter i r1 r2 r3) ; r: result
    (cond ((= i n) r1)
	  (else (f2-iter (+ i 1)
			 (+ r1
			    (* 2 r2)
			    (* 3 r3))
			 r1
			 r2))))
  (cond ((< n 3) n)
	(else (f2-iter 2 2 1 0))))
