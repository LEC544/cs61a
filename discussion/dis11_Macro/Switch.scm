(define-macro (switch expr cases)
    `(let ((val ,expr))
	  ,(cons
	    ;'YOUR-CODE-HERE
        'cond
	    (map (lambda (case) (cons
	           ;'YOUR-CODE-HERE
               `(equal? val ,(car case))
		       (cdr case)))
		     cases))))