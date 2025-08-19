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

; ITERATIVE
(define (fib n)
    (fib-iter 1 0 n))

(define (fib-iter a b count)
    (if (= count 0) ; WHILE LOOP
    b
    (fib-iter (+ a b) a (- count 1))))

(fib 3)



; COIN EXAMPLE:
(define (count-change amount) (cc amount 5))

(define (cc amount kinds-of-coins) ; half, quarter, dime, nickel, penny 
    (cond ((= amount 0) 1)
          ((or (< amount 0) (= kinds-of-coins 0)) 0)
          (else (+ (cc amount
                        (- kinds-of-coins 1))
                    (cc (- amount
                            (first-denomination kinds-of-coins))
                            kinds-of-coins)))))

(define (first-denomination kinds-of-coins)
    (cond ((= kinds-of-coins 1) 1)
            ((= kinds-of-coins 2) 5)
            ((= kinds-of-coins 3) 10)
            ((= kinds-of-coins 4) 25)
            ((= kinds-of-coins 5) 50)))

(count-change 30)

; PROBLEM:

; RECURSION:
(define (r1 n)
    (cond ((< n 3) n)) ; BASE CASE: return n if n < 3.
    (>= n 3)
        (+ (r1 (- n 1)) (* 2 (r1 (- n 2))) (* 3 (r1 (- n 3))) ))

(define (r1 n)
    (if (< n 3) 
        n
        (+ (r1 (- n 1)) (* 2 (r1 (- n 2))) (* 3 (r1 (- n 3))) )))

; ITERATIVE:
(define (f n)
  (define (iter a b c counter)
    (if (= counter 0)
        a
        (iter b c (+ c (* 2 b) (* 3 a)) (- counter 1))))
  (iter 0 1 2 n)) ; 


(define (f-iter n)
  (if (< n 3)                     ; base cases handled here
      n
      (let loop ([i 3] [a 2] [b 1] [c 0])  ; start at f(3), with f(2),f(1),f(0)
        (if (> i n)               ; when i just passed n, a holds f(n)
            a
            (loop (+ i 1)
                  (+ a (* 2 b) (* 3 c))  ; next = f(i)
                  a
                  b)))))

|#

; EXERCISE 1.12
; notes:
; paused. considering root node.

(define (pascal row col)
    (if ((< row 2) && (< col 2) 
        1)
        ((+ pascal (row - 1) (col - 1)) ) ))

(pascal 3 1)