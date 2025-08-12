#lang simply-scheme

#| 
|#
;TESTING PRIMITIVE CONTRACTS: 
; map flattens things out into a sentence: 
(map car '((suki bhatti) (paul walker) (vin diesel) (dwayne johnson)))

;normal recursion
(define (reverse1 sent)
    (if (empty? sent) ; BASE CASE
        '()
        (se (reverse1 (butfirst sent)) (first sent))))

; cons doesnt work because (CAR, CDR) are differet elements: 
; ie. CONS expects: (elements, list). we give (list, elements).
(define (reverse2 seq)
    (if (null? seq)
    '()
    (cons (reverse2 (cdr seq)) (car seq))))

; use append and list with car and cdr: 
(define (reverse3 seq)
    (if (null? seq)
        '()
        (append (reverse3 (cdr seq)) (list (car seq)))))

(reverse1 '(I cant really see what did I miss))
(reverse2 '(I cant really see what did I miss))
(reverse3 '(I cant really see what did I miss))

(map bf '((she love you) junya! (this on donda) (made a promise)))

; data violation: what domain --> what range
(every bf '((she love you) junya! (this on donda) (made a promise)))


;apply append when multiple elements: 
(apply append (map bf '((god love you) (truth!) (this on eternal) (got 1 reason))))

