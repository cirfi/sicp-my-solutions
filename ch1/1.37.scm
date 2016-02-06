(define (cont-frac n d k)
  (define (cont-frac-recur i)
    (cond ((>= i k) (/ (n k)
		       (d k)))
	  (else (/ (n i)
		   (+ (d i)
		      (cont-frac-recur (+ i 1)))))))
  (cont-frac-recur 1))

(cont-frac (lambda (i) 1.0)
	   (lambda (i) 1.0)
	   11)
;;; -> .6180555555555556

(define (cont-frac n d k)
  (define (cont-frac-iter i result)
    (cond ((>= i k) result)
	  (else (cont-frac-iter (- i 1)
				(/ (n i)
				   (+ (d i)
				      result))))))
  (cont-frac-iter k 0))


