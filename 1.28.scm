(define (square x)
  (* x x))
(define (another-expmod base exp m)
  (define (nontrivial-sqrt? x squaremod)
    (cond ((= x 1) #f)
	  ((= x (- m 1)) #f)
	  (else (= squaremod 1))))
  (cond ((= exp 0)
	 1)
	((even? exp)
	 (let ((x (another-expmod base (/ exp 2) m)))
	   (let ((squaremod (remainder (square x) m)))
	     (cond ((nontrivial-sqrt? x squaremod) 0)
		   (else squaremod)))))
	(else
	 (remainder (* base (another-expmod base (- exp 1) m))
		    m))))
(define (miller-rabin-test a n)
  (cond ((= a n) #t)
	((= (another-expmod a (- n 1) n) 1)
	 (miller-rabin-test (+ a 1) n))
	(else #f)))
(define (prime? n)
  (miller-rabin-test 1 n))

(prime? 10009)
;;; #t
(prime? 10011)
;;; #f
(prime? 1019)
;;; #t
(prime? 1017)
;;; #f
(prime? 4)
;;; #f

;;; Carmichael number
(prime? 561)
;;; #f
(prime? 1105)
;;; #f
(prime? 1729)
;;; #f
(prime? 2465)
;;; #f
(prime? 2821)
;;; #f
(prime? 6601)
;;; #f
