;;; define runtime for GNU Guile
;;; (define (runtime) (tms:clock (times)))

;;; define runtime for Racket
;;; (define (runtime) (current-milliseconds))

;;; timed prime, modified
(define (timed-prime-test n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))
      #f))
(define (report-prime n elapsed-time)
  (display n)
  (display " *** ")
  (display elapsed-time)
  (newline))

;;; prime?
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
(define (fermat-test n)
  (define (random-test a)
    (= (expmod a n n) a))
  (random-test (+ (random (- n 1))
		  1)))
(define (fast-prime? n times)
  (cond ((= times 0) #t)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else #f)))
(define (prime? n)
  (fast-prime? n 233))

;;; search-for-primes
(define (search-for-primes start)
  (define (search-iter n count)
    (cond ((= count 3))
	  ((timed-prime-test n) (search-iter (+ n 2) (+ count 1)))
	  (else (search-iter (+ n 2) count))))
  (cond ((even? start) (search-iter (+ start 1) 0))
	(else (search-iter start 0))))

(search-for-primes 1000)
;;; 1009 *** 1.9999999999999574e-2
;;; 1013 *** .00999999999999801
;;; 1019 *** 1.9999999999999574e-2

(search-for-primes 10000)
;;; 10007 *** 1.0000000000001563e-2
;;; 10009 *** 1.9999999999999574e-2
;;; 10037 *** 1.0000000000001563e-2

(search-for-primes 100000)
;;; 100003 *** .00999999999999801
;;; 100019 *** 1.9999999999999574e-2
;;; 100043 *** 1.0000000000001563e-2

(search-for-primes 1000000)
;;; 1000003 *** .00999999999999801
;;; 1000033 *** 2.0000000000003126e-2
;;; 1000037 *** .00999999999999801


(search-for-primes 1000000000)
;;; 1000000007 *** 1.9999999999999574e-2
;;; 1000000009 *** 1.0000000000001563e-2
;;; 1000000021 *** 1.9999999999999574e-2

(search-for-primes 10000000000)
;;; 10000000019 *** 1.9999999999999574e-2
;;; 10000000033 *** 1.9999999999999574e-2
;;; 10000000061 *** 1.9999999999999574e-2

(search-for-primes 100000000000)
;;; 100000000003 *** 1.9999999999999574e-2
;;; 100000000019 *** 1.9999999999999574e-2
;;; 100000000057 *** 2.0000000000003126e-2

(search-for-primes 1000000000000)
;;; 1000000000039 *** 1.9999999999999574e-2
;;; 1000000000061 *** 1.9999999999999574e-2
;;; 1000000000063 *** 1.9999999999999574e-2


(search-for-primes 1000000000000000000)
;;; 1000000000000000003 *** .0799999999999983
;;; 1000000000000000009 *** .05000000000000071
;;; 1000000000000000031 *** .05000000000000071

(search-for-primes 1000000000000000000000000000000000000000000)
;;; 1000000000000000000000000000000000000000063 *** .15000000000000213
;;; 1000000000000000000000000000000000000000169 *** .08999999999999986
;;; 1000000000000000000000000000000000000000361 *** .08999999999999986

(search-for-primes 10000000000000000000000000000000000000000000000000000000000000000000000000000000)
;;; 10000000000000000000000000000000000000000000000000000000000000000000000000000049 *** .25
;;; 10000000000000000000000000000000000000000000000000000000000000000000000000000247 *** .21000000000000085
;;; 10000000000000000000000000000000000000000000000000000000000000000000000000000561 *** .21000000000000085

;;; O(log(n)) growth
