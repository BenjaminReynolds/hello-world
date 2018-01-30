;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-5) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define SCALE 100)
(define SAIL_SIZE (/ SCALE 2))
(define BOAT_SIZE SAIL_SIZE)

(define SAIL (right-triangle SAIL_SIZE SAIL_SIZE "solid" "tan"))

(define BOAT
  (place-image
   (rectangle SCALE BOAT_SIZE "solid" "white")
   BOAT_SIZE
   (/ BOAT_SIZE 2)
   (circle BOAT_SIZE "solid" "brown")))

(place-image SAIL
               (+ SAIL_SIZE (/ SAIL_SIZE 2))
               (/ SAIL_SIZE 2)
               BOAT)
