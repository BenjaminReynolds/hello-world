;; SICP Exercise 1.4
;;
;; Instructions:
;;
;; Observe that our model of evaluation allows for combinations whose operators
;; are compound expressions. Use this observation to describe the behavior of
;; the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; This procedure will add the value of the input a to the absolute value of
;; the input b by checking if b is greater than 0. If so, it uses the addition
;; operator to add the value of b to a. If not, it uses the subtraction opertor
;; to subtract the value of b from a. (or in other words, add its absolute value)
