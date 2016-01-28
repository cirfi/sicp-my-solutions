;;; define power
(define (^ x n)
  (cond ((= n 0) 1)
	(else (* x (^ x (- n 1))))))
;;; define φ
(define phi (/ (+ 1 (sqrt 5)) 2))
;;; define φ^n/(sqrt 5)
(define (phin n)
  (/ (^ phi n)
     (sqrt 5)))
;;; define ψ
(define psi (/ (- 1 (sqrt 5)) 2))
;;; define ψ^n/(sqrt 5)
(define (psin n)
  (/ (^ psi n)
     (sqrt 5)))
;;; define fibnacci
(define (fib n)
  (define (fib-iter i fib1 fib2)
    (cond ((= n i) fib1)
	  (else (fib-iter (+ i 1) (+ fib1 fib2) fib1))))
  (cond ((or (= n 1) (= n 2)) 1)
	(else (fib-iter 2 1 1))))
;;; to prove fib(n) = (phi^n - psi^n) / (sqrt 5)
(fib 1)
;;;-> 1
(- (phin 1) (psin 1))
;;;-> 1.0
;;; fib(1) = (phi - psi) / (sqrt 5)
(fib 2)
;;;-> 1
(- (phin 2) (psin 2))
;;;-> 0.9999999999999
;;; fib(2) = (phi^2 - psi^2) / (sqrt 5)

;;; while n > 2
;;; fib(n) = (phi^(n-1) - psi^(n-1)) / (sqrt 5) + (phi^(n-2) - psi^(n-2)) / (sqrt 5)
;;; fib(n) = (phi^(n-2) * (phi + 1) - psi^(n-2) * (psi + 1)) / (sqrt 5)
;;; (phi^n - psi^n) / (sqrt 5) = (phi^(n-2) * phi^2 - psi^(n-2) * psi^2) / (sqrt 5)
;;; coz phi^2 = phi + 1, psi^2 = psi + 1
;;; so fib(n) = (phi^n - psi^n) / (sqrt 5)

;;; phi^n / (sqrt 5) = fib(n) + psi^n / (sqrt 5)
;;; fib(n) is integer
;;; psi^n / (sqrt 5) < psi / (sqrt 5) < 0.5
;;; fib(n) is the closest integer to phi^n / (sqrt 5)
