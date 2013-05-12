(define ex-1.2
  (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 1 3))))) (* 3 (- 6 2) (- 2 7))))

; define pascal's triangle
; so pascal-triangle 4 -> '((1) (1 1) (1 2 1) (1 3 3 1) (1 4 6 4 1))

; (expand- row (list 1)) evaluates to (1 1); (expand-row (list 1 1)) evaluates to (1 2 1); 
(define (expand-row p)
  (cons (car p) (expand-row-rest p)))

(define (expand-row-rest p)
  (if (null? (cdr p)) (list 1)
      (cons (+ (car p) (cadr p)) 
            (expand-row-rest (cdr p)))))

; (pascals-row 2) -> (1 2 1), (pascals-row 1) -> (1 1) 
(define (pascals-row n)
  (if (= n 0) (list 1)
      (expand-row (pascals-row (- n 1)))))

(define (pascals-triangle n)
  (define (pas-helper n)
    (if (= n 0) (list (pascals-row 0))
        (cons (pascals-row n) (pas-helper (- n 1)))))
  (reverse (pas-helper n)))

