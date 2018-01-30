;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-9) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(define in ...)

(if (string? in)
    (length in)
    (if (image? in)
        (* (image-width in)
           (image-height in))
        (if (number? in)
            (if (positive? in)
                (- in 1)
                n)
              (if in
                  10
                  20))))
            
                
        