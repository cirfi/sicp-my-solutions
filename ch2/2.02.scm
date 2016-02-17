(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ", ")
  (display (y-point p))
  (display ")"))

(define (make-segment p1 p2)
  (cons p1 p2))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))

(define (average x y)
  (/ (+ x y)
     2))

(define (midpoint-segment seg)
  (let ((start (start-segment seg))
	(end (end-segment seg)))
    (make-point (average (x-point start)
			 (x-point end))
		(average (y-point start)
			 (y-point end)))))

(define test (make-segment (make-point 1 2)
			   (make-point 7 19)))

(print-point (midpoint-segment test))
