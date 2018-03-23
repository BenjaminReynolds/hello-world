;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-36) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)
; Exercise 36. Design the function image-area, which counts the number of pixels in a given image. 

; Image -> Number
; calculates the number of pixels in img
; given: (empty-scene 100 100), expected: 10000
; given: (circle 10 "solid" "blue"), expected: 400
(define (image-area img)
  (* (image-width img)
     (image-height img)))