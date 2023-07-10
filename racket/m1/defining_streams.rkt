#lang racket

(define ones (lambda () (cons 1 ones)))

(define (f x) (cons x (lambda () (f (+ 1 x)))))
(define nats (lambda () (f 1)))

(define nats
  (letrec ([f (lambda (x) (cons x (lambda () (f (+ 1 x)))))])
    (lambda (f 1))))

