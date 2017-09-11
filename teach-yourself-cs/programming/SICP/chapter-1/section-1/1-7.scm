;; SICP Exercise 1.7
;;
;; Instructions:
;;
;; The good-enough? test used in computing square roots will not be very
;; effective for finding the square roots of very small numbers. Also, in real
;; computers, arithmetic operations are almost always performed with limited
;; precision. This makes our test inadequate for very large numbers. Explain
;; these statements, with examples showing how the test fails for small and large
;; numbers. An alternative strategy for implementing good-enough? is to watch how
;; guess changes from one iteration to the next and to stop when the change is a
;; very small fraction of the guess. Design a square-root procedure that uses
;; this kind of end test. Does this work better for small and large numbers?

;; When computing the sqrt of a very small number, (anything under the tolerance
;; of `good-enough?`, 0.001) this method is highly innacurate. In addition, when
;; dealing with very large numbers, a small difference between two guesses may
;; not be noticed by the algorithm.

;; An improvment to this algorithm that would perform better on smaller and
;; larger numbers:

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess))
     (* guess .001)))
