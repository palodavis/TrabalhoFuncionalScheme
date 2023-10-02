#lang scheme

(define item1 '(2 10))
(define item2 '(3 7))
(define item3 '(4 5))
(define item4 '(5 6))

(define (select-items items select-func)
  (cond
    ((null? items) '())
    ((select-func (car items))
     (cons (car items) (select-items (cdr items) select-func)))
    (else (select-items (cdr items) select-func))))

(define (calculate-total-value selected-items)
  (let ((total-value 0))
    (define (helper items)
      (cond
        ((null? items) total-value)
        (else
         (let ((item (car items)))
           (set! total-value (+ total-value (cadr item)))
           (helper (cdr items))))))
    (helper selected-items)))

(define (knapsack capacity)
  (lambda (items)
    (let ((selected-items (select-items items (lambda (item) (<= (car item) capacity)))))
      (list selected-items (calculate-total-value selected-items)))))

(define knapsack-capacity-5 (knapsack 5))
(define knapsack-capacity-10 (knapsack 10))

(define items-to-choose (list item1 item2 item3 item4))

(display (knapsack-capacity-5 items-to-choose))

(display (knapsack-capacity-10 items-to-choose))