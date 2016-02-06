(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (cond ((close-enough? guess next) next)
	    (else (display next)
		  (newline)
		  (try next)))))
  (try first-guess))

(fixed-point (lambda (x) (/ (log 1000) (log x))) 2)
;;; (32 + 1) steps

(define (average x y)
  (/ (+ x y) 2))

(fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2)
;;; (8 + 1) steps
