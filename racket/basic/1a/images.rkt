;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname images) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(require 2htdp/image)

;(circle 30 "outline" "blue")
;(rectangle 50 40 "solid" "red")
;(text "surya" 25 "green")

;(above (circle 20 "solid" "red")
;       (circle 40 "solid" "blue")
;       (circle 60 "solid" "green"))

;(beside (circle 20 "solid" "red")
;        (circle 40 "solid" "blue")
;        (circle 60 "solid" "green"))

(overlay (circle 20 "solid" "red")
         (circle 40 "solid" "blue")
         (circle 60 "solid" "green"))