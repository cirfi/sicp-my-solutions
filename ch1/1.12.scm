(define (pascal-triangle line position)
  (cond ((or (= position 1) (= position line)) 1)
	(else (+ (pascal-triangle (- line 1) (- position 1))
		 (pascal-triangle (- line 1) position)))))
