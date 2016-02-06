(define (inc x) (+ x 1))
(define (sum term a next b)
  (cond ((> a b) 0)
	(else (+ (term a)
		 (sum term (next a) next b)))))
(define (simpson-integral f a b n)
  (let ((h (/ (- b a) n)))
    (define (simpson-term k)
      (let ((yk (f (+ a (* k h)))))
	(* (cond ((or (= k 0) (= k n)) 1)
		 ((even? k) 2)
		 (else 4))
	   yk)))
    (* (/ h 3) (sum simpson-term 0 inc n))))

(define (cube x)
  (* x x x))
(simpson-integral cube 0 1 100)
;;; 1/4
(simpson-integral cube 0 1 1000)
;;; 1/4
  
