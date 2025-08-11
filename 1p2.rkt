#lang sicp

#|
; EXERCISE 1.9:

(+ 4 5) ; prints 9whats iterative vs. recursive? what does SICP want me to understand to become wizard

(define (r+ a b)
    (if (= a 0) b ; BASE CASE
        (inc (r+ (dec a) b)))) ; RECURSION (+ is a function, not a math operation)

(define (inc x) 
    (+ x 1))
(define (dec x) 
    (- x 1))

(define (i+ a b)
    (if (= a 0) b ; BASE CASE
        (i+ (dec a) (inc b)))) ; ITERATIVE: stops when a = 0 and b = 9.

(+ 4 5)

; EXERCISE 1.10:

(define (Apply x y)
    (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (Apply (- x 1) (Apply x (- y 1))))))

; apply (0) (Apply (1 9)) = 2 * Apply (1 9)
; apply (0) (apply 0) (apply 8 1) = 2 * 2 * apply (1 8)
; 2^10
; (Apply 1 10)
(Apply 2 4)
; (Apply 2 4)
; (apply (1) (apply (2 (3)) ))
; guess: 4^4
 (Apply 3 3)
; oh man, Ackman got me.

(define (fly n) (A 0 n))
(fly 2)
; (f n) = 2 * n

(define (gly n) (A 1 n))
(gly 2)
(A 1 2)
(apply (0) (apply (1 1)))

(A 1 n)
(apply (0) (apply (1 n)))
2 * 2 * 2 * .. n
(gly 2) = 2^n

;tetration boring.
(A 2 n)
(Apply (1) (Apply 2 (n - 1)))
(Apply (0))
(4^n)



; EXERCISE 1.11 
; notes:

; RECURSION
(define (fib n)
    (cond ((= n 0) 0) ; BASE CASE
            ((= n 1) 1)
            (else (+ (fib (- n 1))
                    (fib (- n 2))))))

(display (fib 8))
|#
; ITERATIVE
(define (fib n)
    (fib-iter 1 0 n))

(define (fib-iter a b count)
    (if (= count 0) ; WHILE LOOP
    b
    (fib-iter (+ a b) a (- count 1))))

(fib 3)


