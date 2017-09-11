;; SICP Exercise 1.3
;;
;; Instructions:
;;
;; Define a procedure that takes three numbers as arguments and returns the sum
;; of the squares of the two larger numbers.

(define (sum-of-two-larger-squares x y z)
  (cond (and (< x y) (< x z)) (sum-squares y z)
        (and (< y x) (< y z)) (sum-squares x z)
        (and (< z x) (< z y)) (sum-squares x y)))

(define (square x)
  (* x x))

(define (sum-squares x y)
  (+ (square x) (square y)))
