;; SICP Exercise 1.18
;;
;; Instructions:
;;
;; Using the results of Exercise 1.16 and Exercise 1.17, devise a procedure that
;; generates an iterative process for multiplying two integers in terms of
;; adding, doubling, and halving and uses a logarithmic number of steps.

(define (efficient-times a b)
  (times-iter a b 1))

(define (times-iter a b n)
  (cond ((= b 0) n)
        ((even? b) (times-iter (double a) (halve b) n))
        (else (times-iter a (- b 1) (+ a n)))))
