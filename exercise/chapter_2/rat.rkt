#lang racket

;; 有理数的算数运算

;; 计算最大公约数的过程
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; 有理数的表示
;; 使用gcd化简该有理数
(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

;; 取出分子
(define (numer x)
  (car x))
;; 取出分母
(define (denom x) (cdr x))
;; 输出分数
(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

;; 定义运算过程
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

;; test
(define one-half (make-rat 1 2))
(define one-three (make-rat 1 3))
(print-rat (add-rat one-half one-three))
(print-rat (sub-rat one-half one-three))
(print-rat (mul-rat one-half one-three))
(print-rat (div-rat one-half one-three))
(newline)
(equal-rat? one-half one-three)