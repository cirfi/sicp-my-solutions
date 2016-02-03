(define (square x)
  (* x x))
(define (expmod base exp m)
  (cond ((= exp 0)
	 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))
(define (fermat-test n a)
  (= (expmod a n n) a))
(define (not-fast-prime? n a)
  (cond ((< a n) (cond ((fermat-test n a) (not-fast-prime? n (+ a 1)))
		       (else #f)))
	(else #t)))
(define (prime? n)
  (not-fast-prime? n 1))

(prime? 561)
;;; #t
(prime? 1105)
;;; #t
(prime? 1729)
;;; #t
(prime? 2465)
;;; #t
(prime? 2821)
;;; #t
(prime? 6601)
;;; #t
