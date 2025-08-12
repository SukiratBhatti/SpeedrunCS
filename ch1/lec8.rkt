#lang simply-scheme
; RECURSION

; charlotte: (count '(she loves you))
; carl      (+ 1 (count '(loves you)))
; cathy     (+ 1     (count '(loves)))
; charlie   (+ 1 (     (count '() )))


; ITERATIVE:
; carol: (count '(she loves you))
; irving: (iter '(she loves you) 0)

; irving says: 'is the sentence empty?' --> give it to alonzo

; isabel: (iter '(loves you) 1)
; ichebad: (iter '(you) 2)
; irene:   (iter '() 3)

; distinction: no need to wait for memory in iterative.  

#|
;; Recusive version

(define (count sent)
    (if (empty? sent) 0 ; => BASE 
    (+ 1 (count (bf sent)) ))) ; => RECURSIVE

;; Iterative:

(define (counted sent)
    (define (iter wds result)
        (if (empty? wds) 
        result
        (iter (bf wds) (+ 1 result))))
    (iter sent 0)) ; => ITERATION (equivalent to a while loop?)

(counted '(she loves you the beatles)) ; => 5

|#

;; PASCAL

(define (pascal row col)
    (cond ((= col 0) 1)
          ((= col row) 1)
            (else (+ (pascal (- row 1) (- col 1))
                    (pascal (- row 1) col))) ))
(pascal 4 1)

;; holy hell how does this work ^^

;; too complex to do, yet. 
(pascal-row 4)