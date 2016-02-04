;;; recursive
(define (accumulate combiner null-value term a next b)
  (cond ((> a b) null-value)
	(else (combiner (term a)
			(accumulate combiner null-value term (next a) next b)))))

(define (sum term a next b)
  (accumulate + 0 term a next b))
(define (product term a next b)
  (accumulate * 1 term a next b))

;;; iterative
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (cond ((> a b) result)
	  (else (iter (next a) (combiner result (term a))))))
  (iter a null-value))
