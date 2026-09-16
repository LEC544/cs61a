(define (square n) (* n n))

(define (pow base exp) 
  'YOUR-CODE-HERE
  (if (zero? exp) 1
  (if (= (modulo exp 2) 0) (pow (square base) (/ exp 2))
      (* base (pow base (- exp 1)))))
  )

(define (repeatedly-cube n x)
  (if (zero? n)
      x
      (let ((y (repeatedly-cube (- n 1) x)))
        (* y y y))))

(define (cddr s) (cdr (cdr s)))

(define (cadr s) 
  'YOUR-CODE-HERE
  (car (cdr s))
  )

(define (caddr s) 
  'YOUR-CODE-HERE
  (car (cddr s))
  )
