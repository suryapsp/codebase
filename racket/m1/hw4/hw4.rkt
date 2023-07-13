
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below

;; sequence
(define (sequence low high stride)
  (if (> low high)
      (list)
      (cons low (sequence (+ stride low) high stride))))

;; string-append-map
(define (string-append-map xs suffix)
  (map (lambda (i)
         (string-append i suffix)) xs))

;; list-nth-mod
(define (list-nth-mod xs n)
  (cond [(< n 0) (error "list-nth-mod: negative number")]
        [(null? xs) (error "list-nth-mod: empty list")]
        [#t (car (list-tail xs (remainder n (length xs))))]))
