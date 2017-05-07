;; SICP Exercise 1.7
;;
;; Instructions:
;;
;; Newton’s method for cube roots is based on the fact that if y is an
;; approximation to the cube root of x, then a better approximation is given by
;; the value Use this formula to implement a cube-root procedure analogous to
;; the square-root procedure.
;;
;; x/y^2 + 2y
;; ----------
;;      3

(define (improve-cube guess x)
  (/ (+ (/ x (square guess) (* 2 guess)) 3)))

(define (cube-iter x)
  (if (good-enough? guess x)
      guess
      (cube-iter (improve-cube guess x)
                 x)))

(define (cube-root x)
  (cube-iter 1.0 x))

;; note: this solution uses several of the function definition from previous
;; exercises.
