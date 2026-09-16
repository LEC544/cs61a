(define (curry-cook formals body) 
  ;'YOUR-CODE-HERE
  ; scm> (curry-cook '(a) 'a)
  ; (lambda (a) a)
  ; scm> (curry-cook '(x y) '(+ x y))
  ; (lambda (x) (lambda (y) (+ x y)))
  (if (null? formals) body
    (list 'lambda (list (car formals)) (curry-cook (cdr formals) body)))
  )

(define (curry-consume curry args)
  ;'YOUR-CODE-HERE
  ; scm> (define three-curry (lambda (x) (lambda (y) (lambda (z) (+ x (* y z)))) ))
  ; three-curry
  ; scm> (define eat-two (curry-consume three-curry '(1 2))) ; pass in only two arguments, return should be a one-arg lambda function!
  ; eat-two
  ; scm> eat-two
  ; (lambda (z) (+ x (* y z)))
  ; scm> (eat-two 3) ; pass in the last argument; 1 + (2 * 3)
  ; 7
  ; scm> (curry-consume three-curry '(1 2 3)) ; all three arguments at once
  ; 7
  (if (null? args) 
    curry
    (curry-consume (curry (car args)) (cdr args)))
  )

(define-macro (switch expr options)
  (switch-to-cond (list 'switch expr options)))

(define (switch-to-cond switch-expr)
  (cons 'cond
        (map (lambda (option)
               (cons `(equal? ,(car (cdr switch-expr)) ,(car option)) (cdr option)))
             (car (cdr (cdr switch-expr))))))
