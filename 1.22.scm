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
	(else (find-divisor n (+ test-divisor 1)))))
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

(search-for-primes 1000)
;;; 1009 *** 0.
;;; 1013 *** 0.
;;; 1019 *** 0.

(search-for-primes 10000)
;;; 10007 *** 0.
;;; 10009 *** 0.
;;; 10037 *** 0.

(search-for-primes 100000)
;;; 100003 *** 1.0000000000000675e-2
;;; 100019 *** 0.
;;; 100043 *** 0.

(search-for-primes 1000000)
;;; 1000003 *** 9.999999999999787e-3
;;; 1000033 *** 0.
;;; 1000037 *** 0.

;;; the former cases are too small for modern computers

(search-for-primes 1000000000)
;;; 1000000007 *** .09999999999999999
;;; 1000000009 *** .06
;;; 1000000021 *** .04999999999999999

(search-for-primes 10000000000)
;;; 10000000019 *** .14
;;; 10000000033 *** .13
;;; 10000000061 *** .14

(search-for-primes 100000000000)
;;; 100000000003 *** .5
;;; 100000000019 *** .43999999999999995
;;; 100000000057 *** .3999999999999999

(search-for-primes 1000000000000)
;;; 1000000000039 *** 1.3199999999999998
;;; 1000000000061 *** 1.2999999999999998
;;; 1000000000063 *** 1.3199999999999994
