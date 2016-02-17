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

(define (make-rect seg height)
  (cons seg height))

(define (dist a b)
  (sqrt (+ (square (- (x-point a)
		      (x-point b)))
	   (square (- (y-point a)
		      (y-point b))))))

(define (width rect)
  (let ((seg (car rect)))
    (let ((a (start-segment seg))
	  (b (end-segment seg)))
      (dist a b))))

(define (height rect)
  (cdr rect))

(define (area rect)
  (* (height rect)
     (width rect)))

(define (perimeter rect)
  (* (+ (height rect)
	(width rect))
     2))

;;; alternative
(define (make-rect a b c)
  (cons a (cons b c)))

(define (height rect)
  (let ((a (car rect))
	(b (car (cdr rect))))
    (dist a b)))

(define (width rect)
  (let ((b (car (cdr rect)))
	(c (cdr (cdr rect))))
    (dist b c)))
