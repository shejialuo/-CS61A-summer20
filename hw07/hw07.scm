(define (cddr s)
  (cdr (cdr s)))

(define (cadr s)
  (car (cdr s))
)

(define (caddr s)
  (car (cddr s))
)


(define (sign num)
  (cond
      ((> num 0) 1)
      ((= num 0) 0)
      (else -1)
  )
)


(define (square x) (* x x))

(define (pow x y)
  (cond
    ((= y 0) 1)
    ((even? y) (square (pow x (/ y 2))))
    (else (* (square (pow x (/ (- y 1) 2 ))) x))
  )
)


(define (unique s)
  (cond
    ((null? s) nil)
    (else
        (cons (car s)
          (unique (filter (lambda (x) (not (eq? (car s) x))) (cdr s)))
        )
    )
  )
)


(define (replicate x n)
  (define (helper x n y)
    (if (= n 0)
      y
      (helper x (- n 1) (cons x y))
    )
  )
  (helper x n nil)
)


(define (accumulate combiner start n term)
  (define (helper i)
    (cond
      ((= i n) (term i))
      (else (combiner (term i) (helper (+ i 1))))
    )
  )
  (combiner start (helper 1))
)


(define (accumulate-tail combiner start n term)
  (define (helper i result)
    (cond
      ((= i (+ n 1)) result)
      (else (helper (+ i 1) (combiner (term i) result)))
    )
  )
  (helper 1 start)
)


(define-macro (list-of map-expr for var in lst if filter-expr)
  (list 'map (list 'lambda (list var) map-expr)
    (list 'filter (list 'lambda (list var) filter-expr) lst)
  )
)

