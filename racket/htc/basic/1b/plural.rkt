;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname plural) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; plural

;; string -> string signature
;; produce the plural word of the given word

;examples
(check-expect (plural "moon") "moons")
(check-expect (plural "planet") "planets")

;(define (plural n) "hello") [stub]

(define (plural w)
  (string-append w "s"))
