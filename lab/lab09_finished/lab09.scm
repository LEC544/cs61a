(define (over-or-under num1 num2)
  'YOUR-CODE-HERE
  (cond 
    ((< num1 num2) -1)
    ((= num1 num2) 0)
    (else          1)))

(define (make-adder num)
  'YOUR-CODE-HERE
  (define add (lambda (inc) (+ inc num)))

  add)

(define (composed f g)
  'YOUR-CODE-HERE
  (define func (lambda (x) (f (g x))))
  func)

(define (repeat f n)
  'YOUR-CODE-HERE
  (define (repeat_f x)
    (if (= n 0) x ((repeat f (- n 1)) (f x))))
  repeat_f
  )

(define (max a b)
  (if (> a b)
      a
      b))

(define (min a b)
  (if (> a b)
      b
      a))

(define (gcd a b) 
  'YOUR-CODE-HERE
  (cond
    ((zero? (min a b)) (max a b))
    (else              (gcd (min a b) (modulo (max a b) (min a b))))))

