;exercise 2.4 try to define cdr

(define (cons x y)
  (lambda (m) (m x y)))

(define (cdr z)
  (z (lambda (p q) q)))

; 2.17 define last-pair so (last-pair (list 1 2)) return 2  (it's a non-empty)

(define (last-pair p)
  (if (null? (cdr p))
    (car p)
    (last-pair (cdr p))))

; 2.18 define reverse

(define (my-reverse p)
  (if (null? p)
    null
    (append (my-reverse (cdr p)) (list (car p)))))

; 2.25 pick 7 from following lists using cars and cdrs
;(1 3 (5 7) 9)
(cdr (car (cdr (cdr p))))

;((7))
(car (car p))

;(1 (2 (3 (4 (5 (6 7))))))
(cdr (cdr (cdr (cdr (cdr p)))))

; 2.27
(define (deep-reverse p)
  (if (null? p)
    null
    (append (deep-reverse (cdr p))
            (let ([hd (car p)])
              (if (list? hd)
                (list (deep-reverse hd))
                (list hd))))))

;2.28
(define (fringe p)
  (if (null? p)
    null
    (append (let ([hd (car p)])
              (if (list? hd)
                (fringe hd)
                (list hd)))
            (fringe (cdr p)))))







