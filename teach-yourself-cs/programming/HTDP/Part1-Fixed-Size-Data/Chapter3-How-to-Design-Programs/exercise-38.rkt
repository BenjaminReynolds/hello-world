;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-38) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 38. Design the function string-remove-last, which produces a string like the given one with the last character removed.

; String -> String
; returns str with the last 1String removed
; given: "hello world", expected: "hello worl"
; given: "awesome", expected: "awesom"
(define (string-remove-last str)
  (substring str 0 (- (string-length str) 1)))