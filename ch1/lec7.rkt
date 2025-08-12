#lang simply-scheme

; WHAT FACTORS, BESIDES ALGOIRTHMS, IMPACT PERFORMANCE?
#|
(define (square x) (* x x))

(define (squares sent)
    (if (empty? sent) '() ; 2 operations
    (se (square (first sent)) 
        (squares (bf sent)) )))

(squares '(9 100 21 0 -3)) ; 6N operations (recursive call)
|#

(define (sort sent)
    (if (empty? sent)
    '()
    (insert (first sent)
            (sort (bf sent)) )))

; higher order procedure

(define (insert NUM sent)
    (cond ((empty? sent)    (se NUM))
            ((< NUM (first sent))   (se NUM sent))
            (else (se (first sent) (insert NUM (bf sent)))) ))

(sort '(9 100 2 -3)) 