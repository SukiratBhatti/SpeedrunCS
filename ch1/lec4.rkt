#lang simply-scheme
;;; COMMON TRANSFORMATION / SELECTION / FUNCTIONS:
;; FUCNTIONAL PROGRAMMING CONTINUED:

#|
(every (lambda (wd) (se wd wd)) '(a b c d))

(accumulate word '(a b c d))
|#

;;; what if this took multiple seconds to compute?: 

(define (roots a b c)
    (se (/ (+ (- b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a))
        (/ (- (- b) (sqrt (- (* b b) (* 4 a c)))) (* 2 a)) ))

(define (root a b c)
    (define (roots1 d)
        (se (/ (+ (- b) d) (* 2 a))
            (/ (- (- b) d) (* 2 a)) ))
    (roots1 (sqrt (- (* b b) (* 4 a c)))) )

; lambda 
(define (roo a b c)
    ((lambda (d)
        (se (/ (+ (- b) d) (* 2 a))
            (/ (- (- b) d) (* 2 a)) ))
    (sqrt (- (* b b) (* 4 a c))) )) 

; let = lambda + invocation ():
(define (ro a b c)
    (let ((d (sqrt (- (* b b) (* 4 a c)))))
        (se (/ (+ (- b) d) (* 2 a))
            (/ (- (- b) d) (* 2 a)) )))

; let for varaibles -b and 2a:
(define (r a b c)
    (let ((d (sqrt (- (* b b) (* 4 a c))))
        (-b (- b))
        (2a (* 2 a)))
    (se (/ (+ -b d) 2a)
        (/ (- -b d) 2a))))

(roots 1 -5 6)
(root 1 -5 6)
(roo 1 -5 6)
(ro 1 -5 6)
(r 1 -5 6)

; example / non example of LET* special form
(let ((a 7))
    (let ((b (+ a 3))
        (* a b))) )

