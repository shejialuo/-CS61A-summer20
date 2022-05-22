(define (split-at lst n)
  (define (helper former latter lst i)
    (cond
      ((null? lst) (cons former latter))
      ((<= i n) (helper (append  former (list (car lst)) ) latter (cdr lst) (+ i 1) ))
      (else (helper former (append latter (list (car lst)) ) (cdr lst) (+ i 1) ))
    )
  )
  (helper nil nil lst 1)
)


(define-macro (switch expr cases)
	(cons _________
		(map (_________ (_________) (cons _________ (cdr case)))
    			cases))
)

