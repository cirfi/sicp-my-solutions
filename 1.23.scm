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
(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (next test-divisor)))))
(define (next test-divisor)
  (cond ((= test-divisor 2) 3)
	(else (+ test-divisor 2))))
(define (divides? a b)
  (= (remainder b a) 0))
(define (prime? n)
  (= n (smallest-divisor n)))

;;; search-for-primes
(define (search-for-primes start)
  (define (search-iter n count)
    (cond ((= count 3))
	  ((timed-prime-test n) (search-iter (+ n 2) (+ count 1)))
	  (else (search-iter (+ n 2) count))))
  (cond ((even? start) (search-iter (+ start 1) 0))
	(else (search-iter start 0))))

(search-for-primes 1000000000)
;;; 1000000007 *** .08000000000000007
;;; 1000000009 *** 4.0000000000000036e-2
;;; 1000000021 *** .03999999999999915

(search-for-primes 10000000000)
;;; 10000000019 *** .11000000000000032
;;; 10000000033 *** .07999999999999918
;;; 10000000061 *** .08000000000000007

(search-for-primes 100000000000)
;;; 100000000003 *** .34000000000000075
;;; 100000000019 *** .23999999999999932
;;; 100000000057 *** .25

(search-for-primes 1000000000000)
;;; 1000000000039 *** .8099999999999996
;;; 1000000000061 *** .7700000000000005
;;; 1000000000063 *** .7599999999999998

;;; not twice fast.
;;; coz we need to do an extra "next" test.
