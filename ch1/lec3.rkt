#lang simply-scheme

; original area procedure
#|
(define pi 3.14)

(define (square-area r) (* r r))
(define (circle-area r) (* r r pi))
(define (sphere-area r) (* r r pi 4))

;;; GENERALIZING
; which becomes --> whats different between the patterns? (constant factor)

(define (area shape r) (* shape r r))

(define square 1)
(define circle pi)
(define sphere( * 4 pi))

(area circle 5)
(area square 6)
|#


; next example:

(define (sumsquare a b)
    (if (> b a)
    (+ (* a a) (sumsquare (+ a 1) b))
    0))

(sumsquare 3 5)

(define (sum shit a b)
    (if (> a b)
        0
        (+ (shit a) (sum shit (+ a 1) b))))


; ERROR: FAILS (sum (* x x) 3 5)

(define (square x) (* x x))
(sum square 5 5)

; next example:

;;; how to think about it: FUNCTIONS RETURN 1 VALUE!
#|
(define (evens nums)
  (cond ((empty? nums) '())
        ((= (remainder (first nums) 2) 0) ; is it an even number?
         (se (first nums) (evens (bf nums)))) ; if yes, save if even. 
        (else (evens (bf nums)))))

(define (ewords sent)
  (cond ((empty? sent) '())
        ((member? 'e (first sent))
         (se (first sent) (ewords (bf sent))))
        (else (ewords (bf sent)))))

(define (pronouns sent)
  (cond ((empty? sent) '())
        ((member? (first sent) '(i me you he she it him her we us they them))
         (se (first sent) (pronouns (bf sent))))
        (else (pronouns (bf sent)))))

(evens '(3 5 6 8 0 9))

(ewords '(got to get you into my life))

(pronouns '(i want to dance with you))
|#

;;; GENERALIZING ARGUMENT: 

(define (keep PRED sent)
    (cond ((empty? sent) '())
          ((PRED (first sent))
           (se (first sent) (keep PRED (bf sent))))
          (else (keep PRED (bf sent)))))

(keep even? '(1 2 3 4 5 6 7))

(define (eword? wd) (member? 'e wd))

(keep eword? '(got to gets you into my lifes))

;;; a*x + b

(keep (lambda (wd) (member? 'e wd))
      '(being for the benefit of mister kite))