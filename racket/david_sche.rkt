; 3.8
(define (xor pred1 pred2)
 (if (and (or pred1 pred2) (not (and pred2 pred1)))
  #t
  #f))

;3.9
(define (absvalue x)
 (if (> x 0)
  x
  (* -1 x)))

;3.10
(define (bigger-magnitude x y)
  (if (> (absvalue x) (absvalue y))
      x
      y))

;3.11
(define (bigger x y)
 (if (> x y) 
  x
  y))

(define (biggest x y z)
 (if (= (bigger x y) x)
  (bigger x z)
  (bigger y z)))

;3.11 method 2
(define (biggest2 x y z)
 (if (> x y)
  (if (> x z)
   x
   z)
  (if (> y z)
   y
   z)))

(define fcompose
 (lambda (f g) (lambda (x) (g (f x)))))


;4.3 For example, ((fcompose3 abs inc square) −5) should evalu- ate to 36. Define fcompose3 
(define (fcompose3 f1 f2 f3)
  (lambda (x) (f3 (f2 (f1 x)))))

(define (fcompose4 f1 f2 f3)
  (fcompose (fcompose f1 f2) f3))

;4.4 Define a f2compose procedure that composes two procedures where the first procedure takes two inputs, and the second procedure takes one input.
;For example, ((f2compose + abs) 3 −5) should evaluate to 2.
(define f2compose
 (lambda (f g) (lambda (x y) (g (f x y)))))

(define (f3compose f g)
 (lambda (x y) (g (f x y))))

(define (factorial n)
 (if (= n 0)
  1
  (* n (factorial (- n 1)))))

(define (gauss-sum n)
 (if (= n 1)
  1
  (+ n (gauss-sum (- n 1)))))

;4.9 (find-maximum-input inc 1 10) should evaluate to 10 and
;(find- maximum-input (lambda (x) (∗ x (− 5.5 x))) 1 10) should evaluate to 3.

(define (find-maximum-val f low high)
 (if (= low high)
  (f low)
  (bigger (f low) (find-maximum-val f (+ 1 low) high))))

(define (find-maximum-num f low high)
  (if (= low high)
   low
   (if (< (f low) (find-maximum-val f low high))
    (find-maximum-num f (+ low 1) high)
    low)))

;4.13 factorial tail recursive
(define (factorial-tail-recursive n)
  (define (factorial-helper n acc)
   (if (= n 1) acc
    (factorial-helper (- n 1) (* acc n))))
 (factorial-helper n 1))

;4.14 find-maximum-num recusive
(define (find-maximum-recursive f low high)
 (define (helper f low high best)
  (if (= low high)
   (bigger best (f low))
   (helper f (+ 1 low) (high) (bigger (f low) best))))
 (helper f low high (f low)))

;Exercise 5.8. 
;Define a procedure that constructs a quintuple 
;and procedures for selecting the five elements of a quintuple.

(define (make-quintuple a b c d e)
 (cons a (cons b (cons c (cons d e)))))

(define (quin-first q) (car q)) 
(define (quin-sec q) (cadr q)) 
(define (quin-third q) (car (cddr q)))
(define (quin-fourth q) (cadr (cddr q)))
(define (quin-fifth q) (cddr (cddr q)))
