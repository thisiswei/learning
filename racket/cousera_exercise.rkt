;write a definition sequnce so
;(sequence 3 11 2) -> ’(3 5 7 9 11)
;(sequence 3 8 3) -> ’(3 6)
;(sequence 3 2 1) -> ’()

(define (sequence low high step)
  (if (<= high low) null
      (cons low (sequence (+ step low) high step))))
      
;2. Write a function string-append-map that takes a list of strings xs and a string suffix and returns a list of strings.
;Each element of the output should be the corresponding element of the input appended
;with suffix (with no extra space between the element and suffix).
;You must use Racket-library functions map and string-append

(define (string-append-map xs suffix)
  (if (null? xs) null
      (map (lambda (x) (string-append x suffix)) xs)))

;3 Write a function list-nth-mod that takes a list xs and a number n. If the
;number is negative, terminate the computation with (error "list-nth-mod:                                                           negative number").
;Else if the list is empty, terminate the computation with (error "list-nth-mod:                                                                  empty list").
;Else return the ith element of the list where we count from zero and i is the
;remainder produced when dividing n by the list’s length. Library functions
;length, remainder, car, and list-tail are all useful – see the Racket
;documentation. Sample solution is 6 lines.
(define (list-nth-mod xs n)
  (if (< n 0) (error "wtf")
      (if (null? xs) (error "bitch, empty")
          (car (list-tail xs (remainder n (length xs)))))))

;fibo-memoize
(define fibo-memo
  (letrec ([memo null]
           [f (lambda (x)
                (let ([ans (assoc x memo)])
                  (if ans
                      (cdr ans)
                      (letrec ([newans (if (or (= x 1) (= x 2))
                                         1
                                         (+ (f (- x 1))
                                            (f (- x 2))))])
                        (begin (set! memo (cons (cons x newans) memo))
                               newans)))))])
    f))
         
;4. Write a function stream-for-n-steps that takes a stream s and a number n.
;It returns a list holding the first n values produced by s in order.  
(define (stream-for-n-steps s n)
  (if (= n 1)
      (list (car (s)))
      (cons (car (s)) (stream-for-n-steps (cdr (s)) (- n 1)))))

;5. Write a stream funny-number-stream that is like the stream of natural numbers (i.
;e., 1, 2, 3, ...) except numbers divisble by 5 are negated (i.e., 1, 2, 3, 4, -5, 6, 7, 8, 9, -10, 11, ...).
