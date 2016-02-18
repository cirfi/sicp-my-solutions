(define (pow base exp)
  (cond ((= exp 0) 1)
	((even? exp) (square (pow base (/ exp 2))))
	(else (* base (pow base (- exp 1))))))

(define (cons x y)
  (* (pow 2 x) (pow 3 y)))

(define (divide? a b)
  (= (remainder b a) 0))

(define (count-divisor n divisor)
  (cond ((divide? divisor n)
	 (+ 1 (count-divisor (/ n divisor) divisor)))
	(else 0)))

(define (car z)
  (count-divisor z 2))

(define (cdr z)
  (count-divisor z 3))
