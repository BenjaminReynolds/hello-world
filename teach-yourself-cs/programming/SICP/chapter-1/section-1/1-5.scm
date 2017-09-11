;; SICP Exercise 1.5
;;
;; Instructions:
;;
;; Ben Bitdiddle has invented a test to determine whether the interpreter he is
;; faced with is using applicative-order evaluation or normal-order evaluation.
;; He defines the following two procedures:

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;; Then he evaluates the expression:

(test 0 (p))

;; What behavior will Ben observe with an interpreter that uses applicative-order
;; evaluation? What behavior will he observe with an interpreter that uses
;; normal-order evaluation? Explain your answer.
;; (Assume that the evaluation rule for the special form if is the same whether
;; the interpreter is using normal or applicative order: The predicate expression
;; is evaluated first, and the result determines whether to evaluate the
;; consequent or the alternative expression.)


;; In an interpreter that uses applicative-order evaluation Ben would see the
;; interpreter freeze as it tries to evaluate the call to the function p. In an
;; interpreter that uses normal-order evaluation the interpreter would not
;; attempt to evaluate the function p as it would not be needed in the call to
;; test, so the program would reutnr the value 0.
