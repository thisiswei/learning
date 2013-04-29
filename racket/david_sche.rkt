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


;5.11
;define a procedure is-list? 
(define (is-list? a)
  (if (null? a) #t
      (if (pair? a) (is-list? (cdr a)) #f)))

;5.12
;Define a procedure list-max that takes a List of non-negative numbers as its input and produces as its result the value of the greatest element in the List (or 0 if there are no elements in the input List).
;For example, (list-max (list 1 1 2 0)) should evaluate to 2.;

(define (list-max l)
  (if (null? l) 0
    (bigger (car l) (list-max (cdr lj))))

(define (list-max lis)
  (list-accumulate bigger 0 lis))

(define (is-list? a)
  (list-accumulate (lambda (a b) #t) #t a))

;5.15. Define a procedure list-last-element that takes as input a List and outputs the last element of the input List.
;If the input List is empty, list-last- element should produce an error.

(define (list-last-element lis)
  (if (null? lis)
      (error "wtf, it's empty")
      (if (null? (cdr lis)) (car lis) (list-last-element (cdr lis)))))


;5.16. Define a procedure list-ordered? that takes two inputs, a test procedure and a List.
;It outputs true if all the elements of the List are ordered according to the test procedure.
;For example, (list-ordered? < (list 1 2 3)) evalu- ates to true, and (list-ordered? < (list 1 2 3 2)) evaluates to false. Hint: think about what the output should be for the empty list.c

(define (list-ordered? p lis)
  (if (or (null? lis) (null? (cdr lis)))
      #t
      (if (p (car lis) (car (cdr lis)))
          (list-ordered? p (cdr lis))
          #f)))

;Exercise 5.17. Define a procedure list-increment that takes as input a List of numbers, and produces as output a List containing each element in the input List incremented by one.
;For example, (list-increment 1 2 3) evaluates to (2 3 4).  

(define (list-increment lis)
  (if (null? lis) null
      (cons (+ 1 (car lis)) (list-increment (cdr lis)))))

;Exercise 5.18. Use list-map and list-sum to define list-length:

(define (list-sum p)
  (if (null? p) 0 (+ (car p) (list-sum (cdr p)))))

(define (list-map p lis)
  (if (null? lis) null
      (cons (p (car lis)) (list-map p (cdr lis)))))

(define (list-length p) (list-sum (list-map (lambda (x) 1) p)))


;Exercise 5.19. Define a procedure list-filter-even that takes as input a List of numbers and produces as output a List consisting of all the even elements of the input List.

(define (list-filter-even lis)
  (if (null? lis) null
      (if (even? (car lis)) 
          (cons (car lis) (list-filter-even (cdr lis)))
          (list-filter-even (cdr lis)))))

;Exercise 5.20. Define a procedure list-remove that takes two inputs: a test pro- cedure and a List. As output, it produces a List that is a copy of the input List with all of the elements for which the test procedure evaluates to true removed. For example, (list-remove (lambda (x) (= x 0)) (list 0 1 2 3)) should evaluates to the List (1 2 3).

(define (list-remove test lis)
  (if (null? lis) null
      (if (test (car lis))
          (list-remove test (cdr lis))
          (cons (car lis) (list-remove test (cdr lis))))))

;Exercise 5.21. [⋆⋆] Define a procedure list-unique-elements that takes as input a List and produces as output a List containing the unique elements of the input List. The output List should contain the elements in the same order as the input List, but should only contain the first appearance of each value in the input List.

(define (elem? ele lis)
  (if (null? lis) #f
      (if (= (car lis) ele) #t
          (elem? ele (cdr lis)))))

(define (uniq-ele lis)
  (define (list-uniq-element lis org)
    (if (null? lis) org 
        (if (elem? (car lis) org)
            (list-uniq-element (cdr lis) org)
            (list-uniq-element (cdr lis) (cons (car lis) org)))))
  (reverse (list-uniq-element lis null)))

;method 2
(define (list-filter test p) 
  (if (null? p) null
      (if (test (car p))
          (cons (car p) (list-filter test (cdr p))) (list-filter test (cdr p)))))

(define (uniq-ele-2 lis)
  (if (null? lis) null
      (if (elem? (car lis) (cdr lis)) 
          (cons (car lis) (uniq-ele-2 (list-filter (lambda (x) (not (= x (car lis)))) lis)))
          (cons (car lis) (uniq-ele-2 (cdr lis))))))

;list-reverse

(define (list-reverse p)
  (define (helper p result)
  (if (null? p) result
      (helper (cdr p) (cons (car p) result))))
  (helper p null))

(define (list-append p q)
  (if (null? p) q
      (cons (car p) (list-append (cdr p) q))))

;method 2
(define (list-reverse-2 p)
  (if (null? p) null
      (list-append (list-reverse-2 (cdr p)) (list (car p)))))

;Exercise 5.22. Deﬁne the list-reverse procedure using list-accumulate.
(define (list-accumulate f base p) 
  (if (null? p)
      base
      (f (car p) (list-accumulate f base (cdr p)))))

(define (list-reverse-3 p)
  (list-accumulate (lambda (x y) (list-append y (list x))) null p))

; intsto5 -> (list 1 2 3 4 5)
(define (intsto n)
  (if (= n 0) null
      (list-append (intsto (- n 1)) (list n))))

;5.23 define factorial using intsto
(define (factorial n)
  (apply * (intsto n)))

;
; sum list-of list....
(define (list-sum p)
  (if (null? p) 0
      (+ (car p) (list-sum (cdr p)))))

(define (nested-list-sum p)
  (if (null? p) 0
      (+ (if (list? (car p))
             (nested-list-sum (car p))
             (car p))
         (nested-list-sum (cdr p)))))

; method 2

(define (list-flatten p)
  (if (null? p) null
      (list-append (car p) (list-flatten (cdr p)))))

(define (deep-list-flatten p)
  (if (null? p) null
      (list-append (if (list? (car p))
                       (deep-list-flatten (car p)
                       (list (car p)))
                   (deep-list-flatten (cdr p)))))

;Exercise 5.24. [⋆] Define a procedure deep-list-map that behaves similarly to list-map but on deeply nested lists. It should take two parameters, a mapping procedure, and a List (that may contain deeply nested Lists as elements), and output a List with the same structure as the input List with each value mapped using the mapping procedure.
;Exercise 5.25. [⋆] Define a procedure deep-list-filter that behaves similarly to list-filter but on deeply nested lists.
