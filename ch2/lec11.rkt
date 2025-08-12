#lang simply-scheme

; building a compiler:

; this is a calculator written in scheme, but the values are a PL.

(define (accumulate op init xs)
  (if (null? xs) init
      (op (car xs) (accumulate op init (cdr xs)))))

;; REPL:
(define (calc)
  (display "calc: ")
  (flush-output)                         ; ok if your Scheme has it; harmless otherwise
  (let ((in (read)))
    (cond ((eof-object? in) 'bye)
          ((or (eq? in 'quit) (eq? in 'exit)) 'bye)
          (else
           (print (calc-eval in)) (newline)
           (calc)))))

; DEEP LISTS:
; RECURSION:
(define (calc-eval exp)
    ; BASE CASE 2 (vertical): evaluate each numbers 
    (cond ((number? exp) exp) 

        ; BASE CASE 1 (horizontal): map calc-eval on empty list: ()
        ((list? exp) (calc-apply (car exp) (map calc-eval (cdr exp)))) 
        (else (error "calc: bad exp: " exp))))

; 2 arguments: function to apply + list of arguments
(define (calc-apply fn args)
  (cond ((eq? fn '+) (accumulate + 0 args))
        ((eq? fn '-) (cond ((null? args) (error "Calc: no args to -"))
                    ((= (length args) 1) (- (car args)))           ; unary minus
                    (else (- (car args) (accumulate + 0 (cdr args))))))

    ((eq? fn '*) (accumulate * 1 args))
    ((eq? fn '/) (cond ((null? args) (error "Calc: no args to /"))
                        ((= (length args) 1) (/ (car args)))           ; reciprocal
                        (else (/ (car args) (accumulate * 1 (cdr args))))))

    (else (error "Calc: bad operator:" fn))))

(sqrt 2)

(+ (* 3 4) (* 5 (+ 6 7)))

(calc)