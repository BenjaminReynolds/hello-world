;; SICP Exercise 1.29
;;
;; Instructions:
;;
;; Simpson’s Rule is a more accurate method of numerical integration than the
;; method illustrated above. Define a procedure that takes as arguments
;; f, a, b, and n and returns the value of the integral, computed using Simpson’s
;; Rule. Use your procedure to integrate cube between 0 and 1 (with n = 100 and
;; n = 1000), and compare the results to those of the integral procedure shown
;; above.

;; sum function from the book

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpsons-rule f a b n)
  (define h (/ (- b a) n))
  (define (y-of-k k)
    (f (+ a (* k h))))
  (define (term v)
    (cond ((or (= v 0) (= v n)) (y-of-k v))
          ((even? v) (* 2 (y-of-k v)))
          (else (* 4 (y-of-k v)))))
  (define (inc v)
    (+ 1 v))
  (* (/ h 3)
     (sum term 0 inc n)))
