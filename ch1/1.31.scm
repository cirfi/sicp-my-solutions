;;; recursive product
(define (product term a next b)
  (cond ((> a b) 1)
	(else (* (term a)
		 (product term (next a) next b)))))

;;; factorial
(define (fac n)
  (define (fac-term x)
    x)
  (define (inc x)
    (+ x 1))
  (product fac-term 1 inc n))

;;; pi
;;; (2*4)/(3*3) = 1-1/(3*3)
;;; (4*6)/(5*5) = 1-1/(5*5)
(define (guess-pi b)
  (define (square x)
    (* x x))
  (define (pi-term x)
    (- 1 (/ 1
	    (square x))))
  (define (pi-inc x)
    (+ x 2))
  (exact->inexact (* 4
		     (product pi-term 3 pi-inc b))))

;;; iterative product
(define (product term a next b)
  (define (iter a result)
    (cond ((> a b) result)
	  (else (iter (next a) (* result (term a))))))
  (iter a 1))
