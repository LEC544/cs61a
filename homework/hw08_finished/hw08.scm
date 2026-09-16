(define (ascending? s) 
    ;'YOUR-CODE-HERE
    (if (or (null? s) (null? (cdr s))) 
        #t
        (if (> (car s) (car (cdr s)))
            #f
            (ascending? (cdr s)))
        )
    )

(define (my-filter pred s) 
    ;'YOUR-CODE-HERE
    (if (null? s)
        nil
        (if (pred (car s))
            ;(append (list (car s)) (my-filter pred (cdr s)))
            (cons (car s) (my-filter pred (cdr s)))
            (my-filter pred (cdr s))
            )
        )
    )


(define (interleave lst1 lst2) 
    ;'YOUR-CODE-HERE
    (cond 
        ((and (not (null? lst1)) (not (null? lst2))) (cons (car lst1) (cons (car lst2) (interleave (cdr lst1) (cdr lst2))))) 
        ((not (null? lst1))                          lst1)
        ((not (null? lst2))                          lst2)
        (else                                        nil)
        )
    )

(define (no-repeats s) 
    ;'YOUR-CODE-HERE
    (if (null? s)
        nil
        (cons (car s) 
            (no-repeats 
                (filter (lambda (x) 
                    (not (= x (car s))))
                        (cdr s)))))
    )
