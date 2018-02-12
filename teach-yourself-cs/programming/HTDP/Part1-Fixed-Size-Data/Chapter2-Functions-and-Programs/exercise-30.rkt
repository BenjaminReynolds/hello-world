;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname exercise-30) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define FIXED_SHOW_COST 180)
(define BASELINE_TICKET_PRICE 5.0)
(define VARIABLE_TICKET_PRICE 0.1)
(define BASELINE_ATTENDANCE 120)
(define VARIABLE_ATTENDANCE 15)
(define VARIABLE_COST 0.04)
(define PRICE_SENSITIVITY 
        (/ VARIABLE_ATTENDANCE VARIABLE_TICKET_PRICE))

(define (attendees ticket-price)
  (- BASELINE_ATTENDANCE
     (* (- ticket-price BASELINE_TICKET_PRICE) PRICE_SENSITIVITY)))

(define (revenue ticket-price)
  (* ticket-price (attendees ticket-price)))

(define (cost ticket-price)
  (+ FIXED_SHOW_COST
     (* VARIABLE_COST (attendees ticket-price))))

(define (profit ticket-price)
  (- (revenue ticket-price)
     (cost ticket-price)))