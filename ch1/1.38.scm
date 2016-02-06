(define (cont-frac n d k)
  (define (cont-frac-recur i)
    (cond ((>= i k) (/ (n k)
		       (d k)))
	  (else (/ (n i)
		   (+ (d i)
		      (cont-frac-recur (+ i 1)))))))
  (cont-frac-recur 1))

(define (d x)
  (cond ((= (remainder x 3) 2)
	 (/ (* (+ x 1)
	       2)
	    3))
	(else 1)))

(cont-frac (lambda (i) 1.0)
	   d
	   20)
;;; .7182818284590452
