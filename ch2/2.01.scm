(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((g (gcd (abs n) (abs d))))
    (cond ((< d 0)
	   (cons (/ (- n) g) (/ (- d) g)))
	  (else
	   (cons (/ n g) (/ d g))))))
