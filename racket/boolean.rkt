;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname boolean) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

(define WIDTH 100)
(define HEIGHT 100)

;(> WIDTH HEIGHT)
;(>= WIDTH HEIGHT)

;(= 1 2)
;(= 1 1)
;(< 7 8)
;(> 7 8)

;(string=? "surya" "singh")

(define IMAGE1 (rectangle 10 20 "solid" "blue"))
(define IMAGE2 (rectangle 20 10 "solid" "red"))

;(< (image-width IMAGE1)
;   (image-width IMAGE2))

(and (< (image-width IMAGE1) (image-width IMAGE2))
     (> (image-height IMAGE1) (image-height IMAGE2)))
