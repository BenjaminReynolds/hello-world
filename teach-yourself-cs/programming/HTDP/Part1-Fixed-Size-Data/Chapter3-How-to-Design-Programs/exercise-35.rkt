;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-35) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 35. Design the function string-last, which extracts the last character from a non-empty string.

; We use strings to represent words

; String -> 1String
; returns the last 1String from str
; given: "hello world", expected: "d"
; given: "awesome", expected: "e"
(define (string-last str)
  (string-ith str (- (string-length str) 1)))


