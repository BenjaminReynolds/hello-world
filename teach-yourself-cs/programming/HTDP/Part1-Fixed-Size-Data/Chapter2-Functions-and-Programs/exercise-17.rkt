;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-17) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))

(require 2htdp/image)

(define (image-classify image)
  (if (= (image-width cat)
         (image-height cat))
      "square"
      (if (> (image-width cat)
             (image-height cat))
          "wide"
          "tall")))