;; SICP Exercise 1.31
;;
;; Instructions:
;;
;; The sum procedure is only the simplest of a vast number of similar
;; abstractions that can be captured as higher-order procedures. Write an
;; analogous procedure called product that returns the product of the values of
;; a function at points over a given range.

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

;; Defining this here so I can use it in both places below

(define (inc n)
  (+ n 1))

;; Show how to define factorial in terms of product.

(define (factorial n)
  (define (return n) n)
  (product return 1 inc n))

;; Also use product to compute approximations to π using the formula...
;; π   2 * 4 * 4 * 6 * 6 * 8 * ....
;; - = ---------------------------.
;; 4   3 * 3 * 5 * 5 * 7 * 7 * ....

(define (approx-pi n)
  (define (f n)
    (if (even? n)
        (/ (+ n 2) (+ n 1))
        (/ (+ n 1) (+ n 2))))
  (* (product f 1 inc n) 4)

;; If your product procedure generates a recursive process, write one that
;; generates an iterative process. If it generates an iterative process, write
;; one that generates a recursive process...

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 0))
