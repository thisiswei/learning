; 99 problems
(define (my-last lst)    ;1
  (if (null? lst)
    null
    (if (null? (cdr lst))
      (car lst)
      (my-last (cdr lst)))))


;2
(define (my-but-last lst)
  (if (null? lst)
    null
    (if (= (length lst) 1)
      null
      (list-ref lst (- (length lst) 1)))))

;3
(define (element-at lst n)
  (list-ref lst n))

(define (element-at-2 lst n)
  (if (= n 0)
    (first lst)
    (element-at-2 (rest lst) (- n 1))))

;4 find the number of elems of a list
(define (num-elems lst)
  (cond 
    [(null? lst) 0]
    [else (+ 1 (num-elems (rest lst)))]))

;5 reverse a list
(define (reverse-lst l)
  (if (null? l)
    null
    (append (reverse-lst (cdr l))
            (list (car l)))))

;6 if a list is a palindrome
(define (ispal lst) (= (reverse lst) lst))

;7 flatten a nested list structure
(define (flatten-lst lst)
  (cond
    [(null? lst) null]
    [(list? (car lst)) (append (flatten-lst (car lst))
                               (flatten-lst (cdr lst)))]
    [else (cons (car lst) (flatten-lst (cdr lst)))]))

;8 eliminate consecutive duplicates of list elems
(define (remove-dups l)
    (cond
     [(empty? l) empty]
     [(empty? (rest l)) l]
     [else
      (let ([i (first l)])
        (if (equal? i (first (rest l)))
            (remove-dups (rest l)) 
            (cons i (remove-dups (rest l)))))]))

;9 implement haskell group
(define (group lst)
  (cond
    [(null? lst) null]
    [(null? (rest lst)) (list lst)]
    [else 
      (let ([head (first lst)]
            [tailhead (first (rest lst))])
        (if (eq? head tailhead)
          (cons (cons head tailhead) (group (rest (rest lst))))
          (cons head (group (rest lst)))))]))

;10 Use the result of problem P09 to implement the so-called run-length encoding data compression method
; '(a a a b b c c) -> ((3 a) (2 b) (2 c))

(define (encode lst)
  (map (lambda (elem)
           (list (length elem) (car elem)))
       (group lst)))

(map (lambda (elem)
       (if (= elem 4)
         (* elem 20)
         (cons elem 1)))
     (list 1 4 2 5))
