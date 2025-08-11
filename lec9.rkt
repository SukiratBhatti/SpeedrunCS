#lang simply-scheme

#|
(define (total-hand hand)
    (if (empty? hand)
    0
    (+ (card-rank (one-card hand))
        (total-hand (remaining-cards hand)))))

; ------------------------
; SELECTORS:


; 2nd abstraction - HANDS:
(define one-card last)
(define remaining-cards butlast)


; 1st abstraction - CARDS:
(define card-rank butlast)
(define card-suit last)

(total-hand '(3h 10c 4d))

; ------------------------
; ADD CONSTRUCTORS:


(define (make-card rank suit)
    (word rank (first suit)))
    

(total-hand (make-hand (make-card 3 'heart)
                        (make-card 10 'club)
                        (make-card 4 'diamond)))


(define make-hand se)


; ------------------------
; CHANGE IMPLEMENTATION:

(define (make-card rank suit)
    (cond ((equal? suit 'heart) rank)
            ((equal? suit 'spade) (+ rank 13))
            ((equal? suit 'diamond) (+ rank 26))
            ((equal? suit 'club) (+ rank 39))
            (else (error "say what?"))))

(define (card-rank card)
    (remainder card 13))

(total-hand (make-hand (make-card 3 'heart)
                        (make-card 10 'club)
                        (make-card 4 'diamond) ))
                    
(make-card 4 'diamond)
|#

; ------------------------
; IMPLEMENTATION of PAIRS as FUNCTIONS

(define (cons x y)
    (lambda (which)
        (cond ((equal? which 'car) x)
              ((equal? which 'cdr) y)
              (else (error "Bad msg to CONS" which)) )))

(define (car pair)
    (pair 'car))

(define (cdr pair)
    (pair 'cdr))

(car (cons 3 4))

(cons 3 (cons 4 (cons 5 '())))

(define p (cons 1 2))
(list? p)        ; #t => built-in cons   |  #f => functional cons
(procedure? p)   ; #f => built-in cons   |  #t => functional cons


; ------------------------

(define (se a b)
    (cond ((word? a) (se (list a) b))
          ((word? b) (se a (list b)))
          (else (append a b))))
        
(define (word? x)
    (or (symbol? x) (number? x)))
    
