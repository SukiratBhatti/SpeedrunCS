#lang simply-scheme
; your defs / experiments

(define (buzz n)
    (cond ((equal? (remainder n 7) 0) 'buzz)
          ((member? 7 n) 'buzz)
          (else n)))

; demo output:
(displayln '(Welcome to buzz))
(buzz 17) 
(buzz 2)
(buzz 14)
(displayln '( ))

(displayln '(Substitution Model))
(define (f a b) (+ (g a ) b))
(define (g x) (* 3 x))
(displayln '(f(2+3) && (13-8)))
(apply f (list (+ 2 3) (- 13 8)))

(displayln '(Applicative order))
(normal (f (+ 2 3) (- 13 8)))


