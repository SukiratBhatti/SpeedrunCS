#lang simply-scheme
; EXERCISE 1.1
#|

(+ a b (* a b)) ; ((3 * 4) + 3 + 4) = 19 
(= a b) ; does 3 == 4? #f

(if (and (> b a) (< b (* a b)))
    b
    a)
; if b >a && b < a*b, print b, else print a. prints 4.


(cond ((= a 4) 6)
        ((= b 4) (+ 6 7 a))
        (else 25))

; if a = 4, print 6. else if b = 4, print 6 + 7 + a. else print 25. prints 16 (b = 4).

(+ 2 (if (> b a) b a))

; if b>a, print b + 2, else print a + 2. prints 6 (b > a).

(define a 3) ; a = 3
(define b (+ a 1)) ; b = 4

(* (cond ((> a b) a)
        ((< a b) b)
        (else -1))
    (+ a 1))

; if a > b, multiply by a. if a < b, mult b. else print -1. multiply by 4. prints 16 (a < b = 4*(3 +1)) 


; EXERCISE 1.2:

(/ (+ 4 5 (- 2(- 3 (+ 6 4/5)))) 
    (* 3 (- 6 2) (- 2 7)))

; EXERCISE 1.3:

(define (square a b c)
    (cond 
        ((and (<= a b) (<= a c))
            (+ (* b b) (* c c)))
        ((and (<= b a) (<= b c))
            (+ (* a a) (* c c)))
        ((and (<= c a) (<= c b))
            (+ (* a a) (* b b))) ))

(square 3 4 5)

; EXERCISE 1.4:

(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))

; if b >0, do a + b. else, do a - b (abs value cuz sub negative = adding pos.)


; EXERCISE 1.5:

(define (p) (p))
(define (test x y)
    (if (= x 0) 0 y))

(test 0 (p))

; APPLICATIVE: first line calls p, but p calls p. recursion ∞!
; NORMAL: if x = 0, the expression = 0. otherwise call p but that doesn't happen.



; EXERCISE 1.6:

(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
          (else else-clause)))

(define (sqrt-iter guess x)
    (new-if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))




; guess = current approx (1)
; x = number we want sqrt of (2)

(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2))

(define (square x)
    (* x x))

; Alternative strategy from Exercise 1.7 - watch how guess changes
(define (good-enough? g1 g2)
    (or (zero? g2)
        (< (/ (abs (- g2 g1)) g1)
            0.001)))

(define (sqrt-iter guess x)
    (let ((better (improve guess x))) ; LOCAL variable LET
        (if (good-enough? guess better)
            guess
            (sqrt-iter better x))))
            
(define (sqrt x)
    (sqrt-iter 1.0 x))

(set! sqrt (lambda (x) (sqrt-iter 1.0 x)))

(sqrt 1e-8)

; EXERCISE 1.8: 

; SKIPPED

; EXERCISE 1.9:

(+ 4 5) ; prints 9whats iterative vs. recursive? what does SICP want me to understand to become wizard

(define (r+ a b)
    (if (= a 0) b ; BASE CASE
        (inc (r+ (dec a) b)))) ; RECURSION (+ is a function, not a math operation)

|#

(define (inc x) 
    (+ x 1))
(define (dec x) 
    (- x 1))

(define (i+ a b)
    (if (= a 0) b ; BASE CASE
        (i+ (dec a) (inc b)))) ; ITERATIVE: stops when a = 0 and b = 9.

(+ 4 5) 

; EXERCISE 1.10:

;PAUSE

(define (Apply x y)
    (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (Apply (- x 1) (Apply x (- y 1))))))

apply (9) (Apply (1 9))

(A 1 10)