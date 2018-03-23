;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-34) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 34. Design the function string-first, which extracts the first character from a non-empty string. Don’t worry about empty strings.

; We use strings to represent words

; String -> 1String (or character)
; returns the first 1String in str
; given: "hello world", expect: "h"
; given: "awesome", expect: "a"
(define (string-first str)
  (string-ith str 0))


